Rails.application.routes.draw do
  get 'cart/index'
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  get '/about' => 'about#show', as: :about

  get '/contact' => 'contact#show', as: :contact

  get '/products' => 'products#index', as: :products
  get '/product/:id' => 'products#show', as: :product, id: /\d+/

  post '/cart/add/:id' => 'cart#add_to_cart', as: :add_to_cart, id: /\d+/
  post '/cart/remove/:id' => 'cart#remove_from_cart', as: :remove_from_cart, id: /\d+/
  get '/cart' => 'cart#index', as: :cart

  post '/order/new' => 'cart#create_order_for_customer', as: :customers
end
