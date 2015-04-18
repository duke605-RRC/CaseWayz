class ProductsController < ApplicationController
  def index
    @products = Product.filter(Product.order(:name), params[:category], params[:query]).page(params[:page]).per(5)
    @categories = Category.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end
