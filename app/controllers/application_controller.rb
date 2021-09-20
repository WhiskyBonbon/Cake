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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :family_name, :k_first_name, :k_family_name, :email, :encrypted_password, :address, :postal_code, :phone_number])
  end
  #deviseがパスワード、メアド以外の情報も保存できるように
end
