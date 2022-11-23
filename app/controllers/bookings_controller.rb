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
      @booking.update(booking_status: 1)
      @product_assignment_controller.create(@product, @booking)
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  # end

  def edit
    @booking = Booking.find(params[:product_id])
  end

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
