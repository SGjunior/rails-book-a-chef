class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :reservation_date, presence: true, uniqueness: { scope: :listing_id }
  validates :reservation_time, presence: true
  validates :guests_count, presence: true # TODO : add validation to be smaller then listing.max_person and bigger then listing.min_person

  private

  def booking_limits
    if guests_count > 10
      errors.add(:guests_count, "can't have more than 10 guests")
    elsif guests_count < 2
      errors.add(:guests_count, "can't have less than 2 guest")
    end
  end
end
