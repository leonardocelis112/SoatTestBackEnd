# Class for manage user model
class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :soat_insurances

  validates :email, presence: true
end
