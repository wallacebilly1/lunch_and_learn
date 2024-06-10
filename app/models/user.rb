class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password
  validates_presence_of :password_confirmation

  has_secure_password

  def generate_api_key
    SecureRandom.hex(16)
  end
end
