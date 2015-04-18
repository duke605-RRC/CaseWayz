class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    session[:cart] << params[:id]
    session[:cart].uniq!

    redirect_to root_path
  end

  def remove_from_cart
    session[:cart] - params[:id]

    redirect_to root_path
  end
end
