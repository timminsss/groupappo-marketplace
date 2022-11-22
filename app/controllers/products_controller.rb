class ProductsController < ApplicationController

  def index_owner
    @products = Product.where(user: current_user)
  end

  def show_owner
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to my_product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :description, :price, :image_url, :product_type)
  end
end
