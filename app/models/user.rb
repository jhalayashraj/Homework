class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: {maximum: 50}
  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { is: 10 },
                 uniqueness: true, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  validates :city, presence: true, length: { maximum:50 }

  has_many :customer_bookings, foreign_key: :customer_id, class_name: 'Booking'
  has_many :cleaner_bookings, foreign_key: :cleaner_id, class_name: 'Booking'

  enum role: { customer: 0, cleaner: 1 }
  ROLES = User.roles.map { |r,| [I18n.t("roles.#{r}"), r] }.sort_by { |r| I18n.t("roles.#{r}") }

end
