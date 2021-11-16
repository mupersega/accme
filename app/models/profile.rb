class Profile < ApplicationRecord
  # every profile Must have a user. I.E. before creating a profile 
  belongs_to :user
  has_many :profile_qualifications
  has_many :qualifications, through: :profile_qualifications

  validates :first_name, presence: { message: "First name is a mandatory field." }
  validates :last_name, presence:  { message: "Last name is a mandatory field." }
  validates :phone, presence: { message: "A valid mobile or home phone is a mandatory field." }
  validates :blurb, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
end
