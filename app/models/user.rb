class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: {maximum: 50}
  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 },
                 uniqueness:
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :city, presence: true, length: { maximum:50 }

  has_many :bookings

  enum role: { customer: 0, cleaner: 1 }
  ROLES = User.roles.map { |r,| [I18n.t("roles.#{r}"), r] }.sort_by { |r| I18n.t("roles.#{r}") }

end
