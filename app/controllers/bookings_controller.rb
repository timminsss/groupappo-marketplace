class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show confirm decline]

  def index
    @bookings = current_user.bookings
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

  def confirm
    @booking.update(booking_status: "confirmed")
    redirect_to owner_booking_path
    # if current_user == @booking.user

    # else
    #   render :show_owner, alert: "not authorized to perform this action...wrote this myself, not pundit"
    # end
    # needs to be refactored with pundit
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
