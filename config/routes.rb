Rails.application.routes.draw do

  namespace :admin do
    devise_for :managers, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, except: [:create, :destroy, :new]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end

  scope module: 'customer' do
    devise_for :users, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords'
    }
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete '/cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/check' => 'orders#check', as: 'check'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resource :customers, only: [:edit, :update]
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/delete' => 'customers#delete', as: 'delete'
    patch 'customers/deleted' => 'customers#deleted', as: 'deleted'
    resources :addresses, except: [:new, :show]
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end




end
