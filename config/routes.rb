Rails.application.routes.draw do
  devise_for :users, controllers:{
    confirmations: 'confirmations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # api/categories
  # api/categories/:category_id/products

  namespace :api do
    resources :sessions, only: [:create]
    
    resources :categories, only: [:index] do
      resources :products, only: [:index, :show]
    end

    resource :profile, only: [:show]
    resource :users, only: [:create]
    resource :cart, only: [:show]
    resources :cart_items, except: [:index]
    resources :orders, only: [:index,:create, :show]
  end
end