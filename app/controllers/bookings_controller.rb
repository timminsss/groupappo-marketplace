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
    raise
    @product = Product.find(@product.id)
    if @booking.save
      @booking.update(booking_status: 1)
      create_product_assignment_path()
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
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
