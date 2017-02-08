# Class for manage user model
class User < ApplicationRecord
  rolify
  has_secure_password

  validates :email, presence: true
end
