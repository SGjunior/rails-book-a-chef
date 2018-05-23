class Listing < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings

  validates :max_party_size, presence: true
  validates :min_party_size, presence: true
  validates :price_per_person, presence: true
  validates :cuisine, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  # validates :longitude, presence: true
  # validates :latitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
