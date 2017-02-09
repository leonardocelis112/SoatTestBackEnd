# Serializer for payment model
class PaymentSerializer < ActiveModel::Serializer
  attributes :value, :contribution, :total, :card_number
  belongs_to :soat_insurance
  belongs_to :user
end
