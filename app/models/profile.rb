class Profile < ApplicationRecord
  # every profile Must have a user. I.E. before creating a profile 
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
end
