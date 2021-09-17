Rails.application.routes.draw do

  namespace :admin do
      devise_for :managers, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }
  end

  scope module: 'customer' do
    devise_for :users, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords'
    }
    
    
  end
  
end
