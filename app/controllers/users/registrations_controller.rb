# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # サインイン状態でもnew、createアクションが行えるようにする
  # prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :require_no_authentication, only: [:cancel]

  # 管理者のみ登録ができるように権限チェック
  before_action :creatable?, only: [:new, :create]

  # 管理者のみ更新ができるように権限チェック
  # before_action :editable?, only: [:edit, :update]

  # authenticate_scope!はself.resourceにcurrent_userを入れるためeditとupdateは対象外にする
  # prepend_before_action :authenticate_scope!, only: [:edit, :destroy]
  prepend_before_action :authenticate_scope!, only: [:destroy]

  prepend_before_action :set_minimum_password_length, only: [:new, :edit]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # 作成者より下位の権限のみ設定できる
    if current_user.role == "システム管理者"
      if params[:user][:role] == "システム管理者"
        redirect_to root_path, alert: "不正なパラメーターです"
      else
        super
      end
    elsif current_user.role == "運用管理者"
      if params[:user][:role] == "システム管理者" || params[:user][:role] == "運用管理者"
        redirect_to root_path, alert: "不正なパラメーターです"
      else
        super
      end
    end
  end

  # GET /resource/edit
  def edit
    # 管理者の場合はparamsのidからresourceを指定
    if by_admin_user?(params)
      self.resource = resource_class.to_adapter.get!(params[:id])

      # 運用管理者はシステム管理者と運用管理者の編集ページにアクセスできない
      if current_user.role == "運用管理者"
        if self.resource.role == "システム管理者" || self.resource.role == "システム管理者"
          raise CanCan::AccessDenied
        end
      end

    # 管理者以外の場合はauthenticate_scope!でresourceにcurrent_userを指定
    else
      authenticate_scope!
      super
    end
  end

  # PUT /resource
  def update
    # 管理者の場合はparamsのidからresourceを指定
    if by_admin_user?(params)
      self.resource = resource_class.to_adapter.get!(params[:id])
    else
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    end

    # 他人を編集できるのは管理者のみ
    unless current_user.role == "システム管理者" || current_user.role == "運用管理者"
      unless self.resource == current_user
        raise CanCan::AccessDenied
      end
    end

    # 運用管理者はシステム管理者と運用管理者を編集できない
    if current_user.role == "運用管理者"
      if self.resource.role == "システム管理者" || self.resource.role == "運用管理者"
        raise CanCan::AccessDenied
      end
    end

    # 自分の権限を変更することはできない
    if current_user == self.resource
      if params[:user][:role].present?
        redirect_to root_path, alert: "不正なパラメーターです"
        return
      end
    end
    
    # 権限を変更できるのは管理者のみ
    unless current_user.role == "システム管理者" || current_user.role == "運用管理者"
      if params[:user][:role].present?
        redirect_to root_path, alert: "不正なパラメーターです"
        return
      end
    end

    # システム管理者はシステム管理者の権限を与えられない
    if current_user.role == "システム管理者"
      if params[:user][:role] == "システム管理者"
        redirect_to root_path, alert: "不正なパラメーターです"
        return
      end
    end

    # 運用管理者はシステム管理と運用管理者の権限を与えられない
    if current_user.role == "運用管理者"
      if params[:user][:role] == "システム管理者" || params[:user][:role] == "運用管理者"
        redirect_to root_path, alert: "不正なパラメーターです"
        return
      end
    end

    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    # 更新
    resource_updated = update_resource(resource, account_update_params)

    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      if !by_admin_user?(params)
        bypass_sign_in resource, scope: resource_name
      end
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    # システム管理者は削除できない
    if current_user.role == "システム管理者"
      redirect_to root_path, alert: "システム管理者は削除できません"
      return
    else
      begin
        super
      rescue
        redirect_to edit_user_registration_path, alert: "関連するレコードがあります"
        return
      end
    end
  end
  
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # paramsがあって管理者権限があるか確認
  def by_admin_user?(params)
    # params[:id].present? && current_user_is_admin?
    params[:id].present? && current_user.role == "システム管理者" || params[:id].present? && current_user.role == "運用管理者"
  end

  # サインインしていて管理者権限を持っているか確認
  def current_user_is_admin?
    # user_signed_in? && current_user.has_role?(:admin)
    # user_signed_in? && current_user.role == "システム管理者" || current_user.role == "運用管理者"
    user_signed_in? && current_user.role == "システム管理者" || user_signed_in? && current_user.role == "運用管理者"
  end

  # The path used after sign up.
  # サインアップ後の遷移先
  def after_sign_up_path_for(resource)
    # super(resource)
    admin_user_path(resource)
  end

  # 更新後の遷移先
  def after_update_path_for(resource)
    # 管理者と管理者以外で分岐
    if resource.role == "システム管理者" || resource.role == "運用管理者"
      admin_user_path(resource)
    else
      edit_user_registration_path
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # サインインしている管理者のみ登録ができるため登録後にサインインはしない
  def sign_up(resource_name, resource)
    # sign_in(resource_name, resource)
  end

  # update_resourceをオーバーライド
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # サインインしていないか、管理者でなければcancancanで処理
  def creatable?
    raise CanCan::AccessDenied unless user_signed_in?
    if !current_user_is_admin?
      raise CanCan::AccessDenied
    end
  end

  # サインインしていないか、管理者でなければcancancanで処理
  # def editable?
  #   raise CanCan::AccessDenied unless user_signed_in?
  #   if !current_user_is_admin?
  #     raise CanCan::AccessDenied
  #   end
  # end

end
