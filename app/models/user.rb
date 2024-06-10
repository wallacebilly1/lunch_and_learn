class User < ApplicationRecord
  before_save :generate_api_key
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password
  validates_presence_of :password_confirmation

  has_secure_password

  has_many :favorites

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
