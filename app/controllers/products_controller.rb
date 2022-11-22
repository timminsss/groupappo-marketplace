class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    if params[:product][:category].present?
      @products = Product.where(category: params[:product][:category])
    else
      @products = Product.all
    end
  end
end
