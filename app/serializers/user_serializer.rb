# Serializer for user model
class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :telephone,
             :email, :document_number, :document_type
  has_many :roles, each_serializer: RoleSerializer
end
