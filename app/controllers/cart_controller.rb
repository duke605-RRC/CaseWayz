class CartController < ApplicationController
  before_action :get_cart_items, only: [:index, :create_order_for_customer]

  def index
    @customer = Customer.new
  end

  def create_order_for_customer
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

  def get_cart_items
    @products = session[:cart].map { |id| Product.find(id) }
    @total = @products.reduce(0) { |_a, e|  + e.price }
    @provinces = Province.all
  end
end
