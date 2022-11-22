class ProductsController < ApplicationController

  def index_owner
    @products = Product.where(user: current_user)
  end

  def show_owner
    @product = Product.find(params[:id])
  end
end
