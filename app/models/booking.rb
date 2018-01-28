class Booking < ApplicationRecord

  validates :city, presence: true, length: { maximum:50 }

  belongs_to :user
end
