class User < ApplicationRecord
  has_many :listings
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true # TODO - VALIDATE ON REGEX
  validates :bio, presence: true  # TODO - LENGTH > 50 CHARACTERS
  validates :age, presence: true  # TODO - MUST BE INTEGER - MUST BE GREATETR THEN 18 - MUST BE YOUNGER THEN 99
end
