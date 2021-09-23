class Customer::OrdersController < ApplicationController

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    @user = current_user
    @order = Order.new(order_params)
    if @order.save

       @cart_items = CartItem.where(user_id: current_user.id)
        @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.taxed_price = cart_item.item.price
        @order_items.piece = cart_item.piece
        @order_items.save
        @cart_items.destroy_all
      end

      redirect_to thanks_path
    else
      render :new
    end
  end

  def check
    @user = current_user
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.postage = 800
    @cart_items = CartItem.where(user_id: current_user.id)

    if params[:order][:address_option] == "0"
      @order.postal_code = @user.postal_code
      @order.address = @user.address
      @order.name = @user.family_name + @user.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code= @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else

    end
  end


  def thanks
  end

  def index
    @orders = Order.where(user: current_user)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :postal_code, :address, :name, :payment_method, :order_amount, :postage, :status)
  end

end
