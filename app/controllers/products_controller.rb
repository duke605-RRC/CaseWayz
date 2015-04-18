class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(5)
  end

  def show
  end
end
