class OrdersController < ApplicationController

  def index
    @user_order = UserOder.new
  end


end
