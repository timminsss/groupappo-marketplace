class ProductAssignmentsController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def new
    @product_assignment = ProductAssignment.new
  end

  def create
    @product_assignment = ProductAssignment.new(product_assignment_params)
    @product_assignment.product = @product
    raise
    if @product_assignment.save
      redirect_to product_assignment_path(@product)
    else
      render :new, notice: 'Try again - not able to add assignment'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_assignment_params
    params.require(:product_assignment).permit(:product_id, :booking_id)
  end
end
