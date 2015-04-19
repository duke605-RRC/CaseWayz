class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_cart

  def setup_cart
    session[:cart] ||= []
  end

  def customer_from_flash
    Customer.new(flash[:customer])
  end
end
