class CartController < ApplicationController
  def index
    @products = session[:cart].map { |id| Product.find(id) }
    @total = @products.reduce(0) { |sum, product| sum += product.price }
    @provinces = Province.all
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

  
end
