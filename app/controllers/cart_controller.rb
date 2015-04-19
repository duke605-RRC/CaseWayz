class CartController < ApplicationController
  before_action :cart_variables, only: [:index, :create_order_for_customer]

  def index
    flash[:customer] = @customer = customer_from_flash
  end

  def create_order_for_customer
    @customer = Customer.new(customer_params)
    return redirect_to :cart unless session[:cart].any?

    if @customer.valid?
      @taxes = @subtotal * @customer.tax_rate
      @total = @subtotal + @taxes
      flash[:customer] = @customer
    else
      render :index
    end
  end

  def confirm_order
    products = session[:cart].map { |e| Product.find(e) }
    customer = customer_from_flash

    unless customer.save
      flash[:notice] = 'There was an error saving the customer! Please try checking out again.'

      return redirect_to root_path
    end

    return root_path unless customer.make_order(products)
    clear_cart
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

  def clear_cart
    session[:cart] = []
    flash.discard

    redirect_to root_path
  end

  private

  def customer_params
    params.require('customer')
      .permit(:first_name, :last_name, :address, :city, :postal_code, :email, :province_id)
  end

  def cart_variables
    @products = session[:cart].map { |id| Product.find(id) }
    @subtotal = @products.reduce(0) { |_a, e|  + e.price }
    @provinces = Province.all
  end
end
