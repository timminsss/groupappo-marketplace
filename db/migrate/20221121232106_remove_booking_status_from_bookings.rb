class RemoveBookingStatusFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :booking_status, :string
  end
end
