class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.update(order_params)
    if @order.status == 1
      @order.order_items.update(status: 1)
    end
    redirect_to :back
  end
end
def order_params
  params.require(:order).permit(:status)
end
