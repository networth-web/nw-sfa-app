class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Deviseの認証
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_admin_authorization
  before_action :check_manage_authorization

  # サインイン後の遷移先
  def after_sign_in_path_for(resource)
    root_path
  end

  # サインアウト後の遷移先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # 権限がなかった場合の処理
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '権限がありません'
  end

  # 管理者ページのアクセス制限
  def check_admin_authorization
    if request.path.start_with?('/admin')
      authorize!(:access_admin_page, :all)
    end
  end

  # 全てのレコードページのアクセス制限
  def check_manage_authorization
    if request.path.include?('/all')
      authorize!(:access_all_list_page, :all)
    end
  end

  private

  # Deviseのストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end
end
