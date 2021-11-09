class ProfileQualification < ApplicationRecord
  belongs_to :profile
  belongs_to :qualification
  belongs_to :major
end
