class LeadSeminarsController < ApplicationController
  before_action :set_lead_seminar, only: [:edit, :update, :update_attend, :update_approval, :edit_reason]

  def create
    @lead = Lead.new(session["lead.regist_data"]["lead"])
    @lead_seminar = @lead.build_lead_seminar(lead_seminar_params)
    respond_to do |format|
      if @lead_seminar.valid?
        @lead.save
        flash[:notice] = 'リードが登録されました'
        session["lead.regist_data"]["lead"].clear
        format.js { render js: "window.location = '#{lead_path(@lead)}'" }
      else
        format.js
      end
    end
  end

  def edit
  end

  def update
    @lead = @lead_seminar.lead
    respond_to do |format|
      if @lead_seminar.update(lead_seminar_params)
        flash[:notice] = 'リードセミナーが更新されました'
        format.js { render js: "window.location = '#{lead_path(@lead)}'" }
      else
        format.js
      end
    end
  end

  def update_attend
    if @lead_seminar.update(lead_seminar_params)
      flash.now[:notice] = '出席が更新されました'
    else
      flash.now[:alert] = '出席が更新されませんでした'
    end
  end

  def edit_reason
  end

  def update_approval
    if @lead_seminar.update(lead_seminar_params)
      flash.now[:notice] = '承認が更新されました'
    else
      flash.now[:alert] = '承認が更新されませんでした'
    end
  end

  private

  def set_lead_seminar
    @lead_seminar = LeadSeminar.find(params[:id])
  end

  def lead_seminar_params
    params.require(:lead_seminar).permit(
      :scheduled_date_time,
      :first_preferred_date_time,
      :second_preferred_date_time,
      :third_preferred_date_time,
      :level_id,
      :attend_reason,
      :experience_investment,
      :interest_investment,
      :question,
      :tracking_id,
      :attend_id,
      :approval_id,
      :disapproval_reason,
      :seminar_id
    )
  end
end