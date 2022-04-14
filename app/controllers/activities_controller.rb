class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update, :destroy]
  before_action :set_lead, only: [:new, :create, :edit, :update, :destroy]

  def all_meetings
    # 失注と非表示以外
    @meetings = Activity.not_lost.not_hide.only_meeting.page(params[:page]).per(50).order(id: "DESC")
    render :meetings
  end

  def my_meetings
    @meetings = Activity.not_lost.not_hide.only_meeting.only_creator(current_user).or(Activity.not_lost.not_hide.only_order.only_attender(current_user)).page(params[:page]).per(50).order(id: "DESC")
    render :meetings
  end

  def all_orders
    @orders = Activity.not_lost.not_hide.only_order.page(params[:page]).per(50).order(id: "DESC")
    render :orders
  end

  def my_orders
    @orders = Activity.not_lost.not_hide.only_order.only_creator(current_user).or(Activity.not_lost.not_hide.only_order.only_attender(current_user)).page(params[:page]).per(50).order(id: "DESC")
    render :orders
  end

  def new
    @activity = @lead.activities.new
    @form_type = params[:form_type]
  end

  def create
    @form_type = params[:activity][:form_type]
    # enumのパラメータエラーを避けるため例外処理
    begin
      @activity = @lead.activities.new(activity_params)
      @activities = @lead.activities
      if @activity.save
        flash.now[:notice] = '活動が作成されました。'
      else
        flash.now[:alert] = '活動の作成に失敗しました'
      end
    rescue ArgumentError
      @activity = @lead.activities.new
      @activity.errors.add(:base, '不正なパラメーターです')
      flash.now[:alert] = '活動の作成に失敗しました'
    end
  end

  def edit
    @form_type = params[:form_type]
  end

  def update
    @form_type = params[:form_type]
    # enumのパラメータエラーを避けるため例外処理
    begin
      @activities = @lead.activities
      if @activity.update(activity_params)
        flash.now[:notice] = '活動が更新されました'
      else
        flash.now[:alert] = '活動の更新に失敗しました'
      end
    rescue ArgumentError
      @activity.errors.add(:base, '不正なパラメーターです')
      flash.now[:alert] = '活動の更新に失敗しました'
    end
  end

  def destroy
    if @activity.destroy
      @activities = @lead.activities
      flash.now[:notice] = '活動が削除されました'
    else
      flash.now[:alert] = '活動の削除に失敗しました'
    end
  end

  def search
    if params[:keyword] == ""
      actions = []
      render json:{ actions: actions }
    else
      actions = ActionModel.where(['name LIKE ?', "%#{params[:keyword]}%"] )
      render json:{ actions: actions }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def activity_params
    params.require(:activity).permit(
      :activity_type,
      :action_name,
      :meeting_type,
      :order_type,
      :overview,
      :start_date_time,
      :end_date_time,
      :meeting_result,
      :attender_id,
      :room_id
    ).merge(creator_id: current_user.id)
  end
end