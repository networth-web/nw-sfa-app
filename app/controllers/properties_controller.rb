class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  authorize_resource
  
  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path(@property), notice: "物件が作成されました"
    else
      flash.now[:alert] = '物件の作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property), notice: "物件が更新されました"
    else
      flash.now[:alert] = '物件の更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    # レコードに紐づくレコードがなければ削除
    if @property.orders.empty?
      if @property.destroy
        redirect_to properties_path, notice: "物件が削除されました"
      else
        redirect_to property_path(@property), alert: "物件の削除に失敗しました"
      end
    else
      redirect_to property_path(@property), alert: "紐付いているレコードがあります"
    end
  end

  private
  
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(
      :name,
      :price
    )
  end
end