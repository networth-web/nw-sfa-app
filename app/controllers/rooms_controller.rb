class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy]
  before_action :set_property, only: [:new, :create, :edit, :update, :destroy]
  authorize_resource

  def new
    @room = Room.new
  end

  def create
    @room = @property.rooms.new(room_params)
    if @room.save
      redirect_to property_path(@property), notice: "部屋が作成されました"
    else
      flash.now[:alert] = '部屋の作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to property_path(@property), notice: "部屋が更新されました"
    else
      flash.now[:alert] = '部屋の更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    # レコードに紐づくレコードがなければ削除
    if @room.activities.empty?
      if @room.destroy
        redirect_to property_path(@property), notice: "部屋が削除されました"
      else
        redirect_to property_path(@property), alert: "部屋の削除に失敗しました"
      end
    else
      redirect_to property_path(@property), alert: "紐付いているレコードがあります"
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
  
  def set_property
    @property = Property.find(params[:property_id])
  end

  def room_params
    params.require(:room).permit(
      :number,
      :price
    )
  end
end