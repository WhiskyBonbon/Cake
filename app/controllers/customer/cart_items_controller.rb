class Customer::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @number = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cartitem|
  end
  
  def update
  end
  
  def destroy
  end
  
  def all_destroy
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :piece)
  end
  
end
