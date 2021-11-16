class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_qualifications
  has_many :qualifications, through: :profile_qualifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :blurb, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }

  has_one_attached :picture
end