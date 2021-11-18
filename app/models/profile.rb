class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_qualifications, dependent: :destroy
  has_many :qualifications, through: :profile_qualifications
  # accepts_nested_attributes_for :profile_qualifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :blurb, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }

  has_one_attached :picture

  def has_qualification?(qualification_id)
    begin
      return true if qualifications.find(qualification_id)
    rescue
      return false
    end
  end
  
  def has_any_qualifications?
    begin
      return profile_qualifications.length > 0
    rescue
      return false
    end
  end

  def get_qualification_major(qualification_id)
    begin
      return profile_qualifications.find_by(qualification_id: qualification_id).major.id
    rescue
      return 0
    end
  end

end