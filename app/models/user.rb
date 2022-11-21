class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable, :lockable, :trackable

  has_many :products
  has_many :bookings
end
