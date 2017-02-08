# Serializer for user model
class VehicleSubtypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :commercial_rate
end
