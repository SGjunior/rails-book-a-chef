class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :listings
  has_many :bookings
  before_validation :strip_email
  after_create :send_welcome_email





#   validates :name, presence: true, uniqueness: true
#   validates :email, presence: true, uniqueness: true, format: {
    # with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # } # TODO - VALIDATE ON REGEX
#   validates :bio, presence: true  # TODO - LENGTH > 50 CHARACTERS
#   validates :age, presence: true  # TODO - MUST BE INTEGER - MUST BE GREATETR THEN 18 - MUST BE YOUNGER THEN 99

end

private

def strip_email
  self.email = email.strip unless email.nil?
end

def send_welcome_email
  FakeMailer.instance.mail(email, "Welcome #{username}!")
end

def age
    if age > 99
      errors.add(:age, "can't be more than 99 yrs to book")
    elsif volume < 18
      errors.add(:age, "can't be less than 18 yrs old")
    end
  end
end
