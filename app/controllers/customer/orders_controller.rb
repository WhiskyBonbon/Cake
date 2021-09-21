class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to check_path
  end

  def check
    @cart_items = CartItem.where(user_id: current_user.id)
    @postage = 800
    @total_price = 
    @all_price = 800 + 200
  end


  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :postal_code, :address, :name, :payment_method, :order_amount, :postage)
  end

end
