class CartController < ApplicationController
  before_action :cart_variables, only: [:index, :create_order_for_customer]

  def index
    @customer = Customer.new
  end

  def create_order_for_customer
    redirect_to cart_path unless session[:cart].any?
    return unless session[:cart].any?

    @customer = Customer.new(customer_params)

    if @customer.save

    else
      render :index
    end
  end

  def add_to_cart
    session[:cart] << params[:id]
    session[:cart].uniq!

    redirect_to :back
  end

  def remove_from_cart
    session[:cart] -= [params[:id]]

    redirect_to :back
  end

  private

  def customer_params
    params.require('customer').permit(:first_name, :last_name, :address, :city, :postal_code, :email, :province_id)
  end

  def cart_variables
    @products = session[:cart].map { |id| Product.find(id) }
    @total = @products.reduce(0) { |_a, e|  + e.price }
    @provinces = Province.all
  end
end
