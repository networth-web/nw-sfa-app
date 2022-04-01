class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @sources = Source.all
  end

  def show
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to source_path(@source), notice: "ソースが作成されました"
    else
      flash.now[:alert] = 'ソースの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @source.update(source_params)
      redirect_to source_path(@source), notice: "ソースが更新されました"
    else
      flash.now[:alert] = 'ソースの更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    # レコードに紐づくレコードがなければ削除
    if @source.leads.empty?
      if @source.destroy
        redirect_to sources_path, notice: "ソースが削除されました"
      else
        redirect_to source_path(@source), alert: "ソースの削除に失敗しました"
      end
    else
      redirect_to source_path(@source), alert: "紐付いているレコードがあります"
    end
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(
      :name,
      :description,
      :approval,
      :user_id
    )
  end
end