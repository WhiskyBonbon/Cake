class Admin::CustomersController < ApplicationController
  
  def index
    @customers = User.page(params[:page])
  end
  
  def show
    @customer = User.find(params[:id])
  end
  
  def edit
    
  end
  
end