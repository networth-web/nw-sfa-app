class SeminarsController < ApplicationController
  before_action :set_seminar, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @seminars = Seminar.all
  end

  def show
    @lead_seminars = @seminar.lead_seminars
  end

  def new
    @seminar = Seminar.new
  end

  def create
    # enumのパラメータエラーを避けるため例外処理
    begin
      @seminar = Seminar.new(seminar_params)
      if @seminar.save
        redirect_to seminar_path(@seminar), notice: "セミナーが作成されました"
      else
        flash.now[:alert] = 'セミナーの作成に失敗しました'
        render :new
      end
    rescue ArgumentError
      @seminar = Seminar.new
      flash.now[:alert] = '不正なパラメーターです'
      render :new
    end
  end

  def edit
  end

  def update
    begin
      if @seminar.update(seminar_params)
        redirect_to seminar_path(@seminar), notice: "セミナーが更新されました"
      else
        flash.now[:alert] = 'セミナーの更新に失敗しました'
        render :edit
      end
    rescue ArgumentError
      flash.now[:alert] = '不正なパラメーターです'
      render :edit
    end
  end
  
  def destroy
    # レコードに紐づくレコードがなければ削除
    if @seminar.lead_seminars.empty?
      if @seminar.destroy
        redirect_to seminars_path, notice: "セミナーが削除されました"
      else
        redirect_to seminar_path(@seminar), alert: "セミナーの削除に失敗しました"
      end
    else
      redirect_to seminar_path(@seminar), alert: "紐付いているレコードがあります"
    end
  end

  private
  
  def set_seminar
    @seminar = Seminar.find(params[:id])
  end

  def seminar_params
    params.require(:seminar).permit(
      :start_date_time,
      :end_date_time,
      :format,
      :title,
      :description,
      :instructor,
      :url
    )
  end
end