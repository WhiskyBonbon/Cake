class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
    
  end


  def index
    if params[:id]
      @orders = User.find(params[:id]).orders.page(params[:page]).reverse_order
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end
  
  
  


private

  def order_params
    params.require(:order).permit(:status)
  end

end
