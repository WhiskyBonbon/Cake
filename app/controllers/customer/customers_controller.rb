class Customer::CustomersController < ApplicationController
    
  def show
    @customer = current_user
  end
  
  def deleted
    @customer = current_user
  end
  
  def delete
    @customer = current_user
    @customer.update(is_deleted: true) #is_deletedをfalseからtrueへ変更し、論理削除
    reset_session #セッション情報のリセットする
    redirect_to root_path
  end
  
  def edit
    @customer = cuurent_user
  end
  
  def update
    @customer = current_user
    @customer.update(customer_path)
    flash[:notice] = 'You have updated customer successfully'
    redirect_to mypage_path
  end
    
end
