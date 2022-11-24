class Product < ApplicationRecord
  CATEGORY_NAME = ["mountain bike", "road bike", "hybrid bike", "accessories"]
  PRODUCT_TYPE_NAME = %w[bike helmets shoes locks guards pumps stand straps lights]
  FILE_TYPES = %w[image/jpeg image/png].freeze
  MAX_FILE_SIZE = 10_000_000

  belongs_to :user
  has_many :product_assignments, dependent: :destroy
  has_many :bookings, through: :product_assignments
  has_one_attached :photo, dependent: :destroy

  validates :category, :name, :description, :price, :product_type, presence: true
  validates :category, inclusion: { in: CATEGORY_NAME }
  validates :product_type, inclusion: { in: PRODUCT_TYPE_NAME }

  validate :validate_file_filetypes
  validate :validate_file_filesize

  private

  def validate_file_filetypes
    return unless photo.attached?

    errors.add(:photo, 'must be a JPG or PNG') unless photo.content_type.in?(FILE_TYPES)
  end

  def validate_file_filesize
    return unless photo.attached?

    errors.add(:photo, 'must be max. 10mb') unless photo.blob.byte_size <= MAX_FILE_SIZE
  end
end
