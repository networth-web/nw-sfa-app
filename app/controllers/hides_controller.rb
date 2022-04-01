class HidesController < ApplicationController
  before_action :set_hide, only: [:show, :edit, :update, :destroy]

  def index
    @hides = Hide.all
  end
  
  def show
  end

  def new
    @hide = Hide.new
  end

  def create
    @hide = Hide.new(hide_params)
    if @hide.save
      redirect_to admin_hide_path(@hide), notice: "非表示が作成されました"
    else
      flash.now[:alert] = '非表示の作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @hide.update(hide_params)
      redirect_to admin_hide_path(@hide), notice: "非表示が更新されました"
    else
      flash.now[:alert] = '非表示の更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    if @hide.destroy
      redirect_to admin_hides_path, notice: "非表示が削除されました"
    else
      redirect_to admin_hide_path(hide), alert: "非表示の削除に失敗しました"
    end
  end

  private
  def set_hide
    @hide = Hide.find(params[:id])
  end
  
  def hide_params
    params.require(:hide).permit(
      :reason,
      :lead_id
    )
  end
end
