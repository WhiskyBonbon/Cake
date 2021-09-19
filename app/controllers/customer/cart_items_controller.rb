class Customer::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItems.where(customer_id: current_customer.id)
    @number = 1, 2, 3, 4, 5, 6, 7, 8, 9, 
  end
  
end
