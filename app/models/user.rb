
class User < ApplicationRecord
  has_secure_password  # This line allows you to securely handle password storage

  validates :username, presence: true, uniqueness: true  # Ensure username is present and unique
  validates :password, presence: true, length: { minimum: 6 }  # Ensure password is present and at least 6 characters long

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }  # Ensure valid email
  validates :password_confirmation, presence: true, if: -> { password.present? }  # Require password confirmation

  attr_accessor :password_confirmation  # Adds password confirmation field that won't be saved to the database
end
