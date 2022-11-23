class Booking < ApplicationRecord
  belongs_to :user
  has_many :product_assignments, dependent: :destroy
  has_many :products, through: :product_assignments

  validates :start_date, :end_date, :booking_status, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }

  enum :booking_status, { draft: 0, unconfirmed: 1, confirmed: 2, completed: 3 }, default: :draft
end
