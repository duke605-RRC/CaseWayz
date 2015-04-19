class ProductsController < ApplicationController
  def index
    @products = Product.filter(Product.all, params).order(:name).page(params[:page]).per(5)
    @categories = Category.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end
