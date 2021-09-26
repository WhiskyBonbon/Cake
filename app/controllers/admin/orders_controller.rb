class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
      @order_items.update_all(production_status: "制作待ち") if @order.status == "入金確認"
      #enumは数字じゃなくて文字
      #uodateはカラムじゃなくてデータそのものを取得しないと動かない
      redirect_to admin_order_path
    else
      redirect_to admin_order_path

    end

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
