class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :notebooks, :notes
end
