class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamp :start_date
      t.timestamp :end_date
      t.float :price

      t.timestamps
    end
  end
end
