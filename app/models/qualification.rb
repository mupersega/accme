class Qualification < ApplicationRecord
  has_many :profile_qualifications
  has_many :profiles, through: :profile_qualifications

end
