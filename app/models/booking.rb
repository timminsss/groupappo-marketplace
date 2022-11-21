class Booking < ApplicationRecord
  belongs_to :user
  has_many :product_assignments
end
