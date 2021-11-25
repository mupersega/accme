class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  validates :content , presence: :true, length: { maximum: 200,
    too_long: "%{count} characters is the maximum allowed" }
  
  scope :unseen, -> { where(seen: false)}
  scope :seen, -> { where(seen: true)}

end
