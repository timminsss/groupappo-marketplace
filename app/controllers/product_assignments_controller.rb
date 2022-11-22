class ProductAssignmentsController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def new
    @product_assignment = ProductAssignment.new
  end

  def create(product, booking)
    @product_assignment = ProductAssignment.new(product: product, booking: booking)
    @product_assignment.save
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

end
