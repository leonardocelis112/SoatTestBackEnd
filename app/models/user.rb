# Class for manage user model
class User < ApplicationRecord
  rolify
  before_create :set_default_role
  has_secure_password
  has_many :soat_insurances

  validates :email, presence: true

  private

  def set_default_role
    add_role(:client)
  end
end
