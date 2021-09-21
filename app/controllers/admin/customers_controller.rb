class Admin::CustomersController < ApplicationController
  
  def index
    @customers = User.page(params[:page])
  end
end