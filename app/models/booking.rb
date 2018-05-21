class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :reservation_date, presence: true, uniqueness: true
  validates :reservation_time, presence: true
  validates :guests_count, presence: true # TODO : add validation to be smaller then listing.max_person and bigger then listing.min_person
end
