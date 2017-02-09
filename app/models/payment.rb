# Class for payment table
class Payment < ApplicationRecord
  belongs_to :soat_insurance
  belongs_to :user

  scope :by_user_id, ->(user_id) { where(user_id: user_id) }
end
