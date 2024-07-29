class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  #before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    #@items = Item.all.order
    #@items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :status_id, :delivery_id, :delivery_days_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end

  #def set_item
  #  @item = Item.find(params[:id])
  #end
end
