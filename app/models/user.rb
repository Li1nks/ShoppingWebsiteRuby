class User < ApplicationRecord
  has_secure_password  # This line allows you to securely handle password storage

  validates :username, presence: true, uniqueness: true  # Ensure username is present and unique
  validates :password, presence: true, length: { minimum: 6 }  # Ensure password is present and at least 6 characters long
end
