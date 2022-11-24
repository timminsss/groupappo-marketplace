class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show confirm decline edit booking_days]

  def index
    # includes loads all the products into memory so you dont have to make alot of sql queries
    @bookings = current_user.bookings.includes(:products)
  end

  def index_owner
    @bookings = current_user.products.map(&:bookings).flatten
  end


  def show
  end

  def show_owner
    @booking = Booking.find(params[:id])
    # needs to be refactored with pundit - acces to the booking only possible if
    # owner = owner of product related to booking
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
      @product_assignment_controller.create_bike(@product, @booking)
      redirect_to product_path(@product), alert: "Booking has been created"
    else
      render "products/show", status: :unprocessable_entity

    end
  end

  def confirm
    @booking.update(booking_status: "confirmed")
    redirect_to owner_booking_path
  end

  def decline
    @booking.update(booking_status: "declined")
    redirect_to owner_booking_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_status, :product_id)
  end
end
