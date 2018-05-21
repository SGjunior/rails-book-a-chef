class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :listings
  has_many :bookings

  # validates :name, presence: true, uniqueness: true
  # validates :age, presence: true  # TODO - MUST BE INTEGER - MUST BE GREATETR THEN 18 - MUST BE YOUNGER THEN 99
end
