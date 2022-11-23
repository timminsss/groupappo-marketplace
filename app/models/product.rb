class Product < ApplicationRecord
  CATEGORY_NAME = ["mountain bike", "road bike", "hybrid bike", "accessories"]
  PRODUCT_TYPE_NAME = %w[bike helmets shoes locks guards pumps stand straps lights]

  belongs_to :user
  has_many :product_assignments, dependent: :destroy

  validates :category, :name, :description, :price, :product_type, presence: true
  validates :category, inclusion: { in: CATEGORY_NAME }
  validates :product_type, inclusion: { in: PRODUCT_TYPE_NAME }
end
