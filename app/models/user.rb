class User < ApplicationRecord
  # after_create :set_role
  rolify

  has_one :profile

  has_many :messages_received, class_name: "Message", foreign_key: :receiver
  has_many :messages_sent, class_name: "Message", foreign_key: :sender

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def set_role
    # set a default role but only if it's empty
    self.add_role(:default_user) if self.roles.blank?
  end
end