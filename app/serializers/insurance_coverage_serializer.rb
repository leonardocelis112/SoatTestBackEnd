# Serializer for user model
class InsuranceCoverageSerializer < ActiveModel::Serializer
  attributes :code, :created_at, :kind
  has_many :insurance_conditions, each_serializer: InsuranceConditionSerializer
end
