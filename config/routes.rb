Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  get '/about' => 'about#show', as: :about

  get '/contact' => 'contact#show', as: :contact

  get '/products' => 'products#index', as: :products
  get '/products/:id' => 'products#show', as: :product, id: /\d+/
  post '/products/add/:id' => 'products#add_to_cart', as: :add_to_cart, id: /\d+/
end
