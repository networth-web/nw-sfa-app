class LostsController < ApplicationController
  before_action :set_lost, only: [:show, :edit, :update, :destroy]
  before_action :set_lead, only: [:show, :new, :create, :edit, :update, :destroy]

  def all_losts
    @losts = Lost.all.page(params[:page]).per(50).order(id: "DESC")
    render :index
  end

  def my_losts
    @losts = Lost.joins(:lead).where(leads: { owner_id: current_user.id }).or(Lost.joins(:lead).where(leads: { closer_id: current_user.id })).page(params[:page]).per(50).order(id: "DESC")
    render :index
  end

  def index
    @losts = Lost.all
  end

  def new
    @lost = Lost.new
  end

  def create
    @lost = @lead.create_lost(lost_params)
    if @lost.save
      flash.now[:notice] = '失注が登録されました'
    else
      flash.now[:alert] = '失注の登録に失敗しました'
    end
  end

  def edit
  end

  def update
    if @lost.update(lost_params)
      flash.now[:notice] = '失注が更新されました'
    else
      flash.now[:alert] = '失注の更新に失敗しました'
    end
  end

  def destroy
    if @lost.destroy
      @lost = @lead.lost
      flash.now[:notice] = '失注が削除されました'
    else
      flash.now[:alert] = '失注の削除に失敗しました'
    end
  end

  private
  
  def set_lost
    @lost = Lost.find(params[:id])
  end

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def lost_params
    params.require(:lost).permit(
      :reason
    ).merge(user_id: current_user.id)
  end

end
