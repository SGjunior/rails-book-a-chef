class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :max_party_size, presence: true
  validates :min_party_size, presence: true
  validates :price_per_person, presence: true
  validates :cuisine, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  # validates :lng, presence: true
  # validates :lat, presence: true
end
