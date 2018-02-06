class UserSerializer < ActiveModel::Serializer
  has_one :user_profile
  attributes :id, :user_name, :email, :user_profile
end
