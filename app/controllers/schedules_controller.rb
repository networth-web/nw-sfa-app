class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy]
  before_action :set_lead, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_beginning_of_week

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = @lead.schedules.new(schedule_params)
    @schedules = @lead.schedules
    if @schedule.save
      flash.now[:notice] = '予定が作成されました。'
    else
      flash.now[:alert] = '予定の作成に失敗しました'
    end
  end

  def edit
  end

  def update
    @schedules = @lead.schedules
    if @schedule.update(schedule_params)
      flash.now[:notice] = '予定が更新されました'
    else
      flash.now[:alert] = '予定の更新に失敗しました'
    end
  end

  def destroy
    if @schedule.destroy
      @schedules = @lead.schedules
      flash.now[:notice] = '予定が削除されました'
    else
      flash.now[:alert] = '予定の削除に失敗しました'
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :description,
      :schedule_date_time,
      :attender_id 
    ).merge(creator_id: current_user.id)
  end
end




