class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :reservation_date, presence: true, uniqueness: true
  validates :reservation_time, presence: true
  validates :guests_count, presence: true # TODO : add validation to be smaller then listing.max_person and bigger then listing.min_person
  validates :booking_limits
end





  private

  def booking_limits
    if guests_count > 10
      errors.add(:guests_count, "can't have more than 10 guests")
    elsif volume < 2
      errors.add(:guests_count, "can't have less than 2 guest"
    end
  end
end)
