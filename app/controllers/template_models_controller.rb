class TemplateModelsController < ApplicationController
  before_action :set_template_model, only: [:show, :edit, :update, :destroy]

  def index
    @templates = TemplateModel.all
  end

  def show
  end

  def new
    @template = TemplateModel.new
  end

  def create
    # enumのパラメータエラーを避けるため例外処理
    begin
      @template = TemplateModel.new(template_model_params)
      if @template.save
        redirect_to admin_template_model_path(@template), notice: "テンプレートが作成されました"
      else
        flash.now[:alert] = 'テンプレートの作成に失敗しました'
        render :new
      end
    rescue ArgumentError
      @template = TemplateModel.new
      flash.now[:alert] = '不正なパラメーターです'
      render :new
    end
  end

  def edit
  end

  def update
    # enumのパラメータエラーを避けるため例外処理
    begin
      if @template.update(template_model_params)
        redirect_to admin_template_model_path(@template), notice: "テンプレートが更新されました"
      else
        flash.now[:alert] = 'テンプレートの更新に失敗しました'
        render :edit
      end
    rescue ArgumentError
      flash.now[:alert] = '不正なパラメーターです'
      render :edit
    end
  end
  
  def destroy
    if @template.destroy
      redirect_to admin_template_models_path, notice: "テンプレートが削除されました"
    else
      redirect_to admin_template_model_path(template), alert: "テンプレートの削除に失敗しました"
    end
  end

  private

  def set_template_model
    @template = TemplateModel.find(params[:id])
  end

  def template_model_params
    params.require(:template_model).permit(
      :template_type,
      :template_text
    )
  end
end