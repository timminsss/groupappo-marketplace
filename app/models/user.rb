class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable, :lockable, :trackable

  has_many :products
  has_many :bookings

  validates :first_name, :last_name, :zip_code, presence: true
  validates :zip_code, format: { with: /^\d{5}$/, message: 'only allows 5 digits' }
end
