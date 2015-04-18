Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'about#show'

  get '/about' => 'about#show', as: :about

  get '/contact' => 'contact#show', as: :contact

  get '/products' => 'products#index', as: :products
  get '/products/:id' => 'products#show', as: :product, id: /\d+/
end
