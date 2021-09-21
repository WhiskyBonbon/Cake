class Admin::CustomersController < ApplicationController

  def index
    @customers = User.page(params[:page])
  end

  def show
    @customer = User.find(params[:id])
  end

  def edit
    @customer = User.find(params[:id])
  end

  def update
    @customer = User.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path, notice:"登録情報を更新しました"
  end

  private
    def customer_params
      params.require(:user).permit(:family_name, :first_name, :k_family_name, :k_first_name, :postal_code, :address, :phone_number, :email, :is_deleted )
    end

end