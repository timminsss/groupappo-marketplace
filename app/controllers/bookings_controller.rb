class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @product_assignment_controller = ProductAssignmentsController.new

    @product = Product.find(params[:product_id])
    if @booking.save
      @product_assignment_controller.create(@product, @booking)
      # redirect_to booking_path(@booking)
      redirect_to product_path(@product)
    else
      render "products/show", status: :unprocessable_entity
      # redirect_to product_path(@product)

    end
  end

  # def destroy
  # end

  # def edit
  # end

  # def update
  # end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_status, :product_id)
  end
end
