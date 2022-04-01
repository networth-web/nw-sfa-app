class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]
  before_action :set_lead, only: [:create, :destroy]

  def create
    @image = @lead.images.new(image_params)
    if @image.save
      redirect_to lead_path(@lead), notice: "画像がアップロードされました"
    else
      redirect_to lead_path(@lead), alert: "画像のアップロードに失敗しました"
    end
  end

  def destroy
    if @image.destroy
      redirect_to lead_path(@lead), notice: "画像が削除されました"
    else
      redirect_to lead_path(@lead), alert: "画像の削除に失敗しました"
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_lead
    @lead = Lead.find(params[:lead_id])
  end

  def image_params
    params.require(:image).permit(:image).merge(user_id: current_user.id)
  end
end
