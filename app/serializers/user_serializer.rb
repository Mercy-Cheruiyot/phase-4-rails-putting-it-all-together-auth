class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :image_url, :bio
  has_many :recipes
end
