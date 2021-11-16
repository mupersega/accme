class Profile < ApplicationRecord
  after_create :link_to_user
  # every profile Must have a user. I.E. before creating a profile 
  belongs_to :user
  has_many :profile_qualifications
  has_many :qualifications, through: :profile_qualifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :phone
  validates :blurb, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
end