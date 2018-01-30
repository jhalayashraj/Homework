class Booking < ApplicationRecord

  validates :city, presence: true, length: { maximum:50 }

  belongs_to :cleaner, class_name: 'User', foreign_key: 'cleaner_id'
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
end
