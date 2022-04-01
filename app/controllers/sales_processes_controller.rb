class SalesProcessesController < ApplicationController
  before_action :set_sales_process, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @sales_processes = SalesProcess.all
  end

  def show
  end

  def new
    @sales_process = SalesProcess.new
  end

  def create
    @sales_process = SalesProcess.new(sales_process_params)
    if @sales_process.save
      redirect_to sales_process_path(@sales_process), notice: "営業プロセスが作成されました"
    else
      flash.now[:alert] = '営業プロセスの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @sales_process.update(sales_process_params)
      redirect_to sales_process_path(@sales_process), notice: "営業プロセスが更新されました"
    else
      flash.now[:alert] = '営業プロセスの更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    # レコードに紐づくレコードがなければ削除
    if @sales_process.leads.empty?
      if @sales_process.destroy
        redirect_to sales_processes_path, notice: "営業プロセスが削除されました"
      else
        redirect_to sales_process_path(@sales_process), alert: "営業営業プロセスの削除に失敗しました"
      end
    else
      redirect_to sales_process_path(@sales_process), alert: "紐付いているレコードがあります"
    end
  end

  private

  def set_sales_process
    @sales_process = SalesProcess.find(params[:id])
  end

  def sales_process_params
    params.require(:sales_process).permit(
      :name,
      :description
    )
  end
end