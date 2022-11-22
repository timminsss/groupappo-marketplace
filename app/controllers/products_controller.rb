class ProductsController < ApplicationController

  def index_owner
    @products = Product.where(user: current_user)
  end
end
