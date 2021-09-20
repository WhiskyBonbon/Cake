class Admin::CustomersController < ApplicationController
  
  def index
    @customers = User.all
  end
    
end