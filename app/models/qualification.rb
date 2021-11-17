class Qualification < ApplicationRecord
  has_many :profile_qualifications, dependent: :destroy
  has_many :profiles, through: :profile_qualifications

end
