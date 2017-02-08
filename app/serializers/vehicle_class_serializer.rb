# Serializer for user model
class VehicleClassSerializer < ActiveModel::Serializer
  attributes :name
  has_many :vehicle_subtypes, each_serializer: VehicleSubtypeSerializer
end
