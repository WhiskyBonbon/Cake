Rails.application.routes.draw do

  namespace :admin do
      devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }
    
    
  end

  scope module: 'customer' do
    devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords'
    }
    
    
  end
  
end
