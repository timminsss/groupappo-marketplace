class Booking < ApplicationRecord
  STATUS_LIST = %w[draft unconfirmed confirmed completed]

  belongs_to :user
  has_many :product_assignments

  validates :start_date, :end_date, :booking_status, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }

  validates :booking_status, inclusion: { in: STATUS_LIST }
end
