class ApplicationController < ActionController::Base
  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     root_path
  #   when Customer
  #     items_path
  #   end
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)   #ログイン後の遷移先を条件分岐
    case resource
    when Manager
      admin_customers_path  #後ほど admin_orders_path に変更
    when User
      root_path
    end
  end
    #参照先 https://qiita.com/IsakiMatsuo/items/4f72c65584c2c9892961


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :family_name, :k_first_name, :k_family_name, :email, :encrypted_password, :address, :postal_code, :phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  end
  #deviseがパスワード、メアド以外の情報も保存できるように
end
