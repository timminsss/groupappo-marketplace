class ProductAssignmentsController < ApplicationController
  def new
    @product_assignment = ProductAssignment.new
  end

  def create
    @product_assignment = ProductAssignment.new(product_assignment_params)
    @product_assignment.save
  end

  private

  def product_assignment_params
    params.require(:product_assignment).permit(:product_id, :booking_id)
  end
end
