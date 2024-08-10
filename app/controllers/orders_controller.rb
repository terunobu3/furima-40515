class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id ! @item.order.present?
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @user_order = UserOrder.new
    else
    redirect_to root_path
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item(@item.price)
      @user_order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item(price)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
