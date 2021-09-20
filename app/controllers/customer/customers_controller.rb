class Customer::CustomersController < ApplicationController
    
  def show
    @customer = current_user
  end
  
  def delete
    @customer = current_user
  end
  
  def deleted
    @customer = current_user
    @customer.update(is_deleted: true) #is_deletedをfalseからtrueへ変更し、論理削除
    reset_session #セッション情報のリセットする
    redirect_to root_path
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @customer = current_user
    @customer.update(customer_path)
    flash[:notice] = 'You have updated customer successfully'
    redirect_to mypage_path
  end
  
  
  private
  
  def customer_path
    params.require(:user).permit(:first_name, :family_name, :k_first_name, :k_family_name, :email, :address, :postal_code, :phone_number)
  end
  
end