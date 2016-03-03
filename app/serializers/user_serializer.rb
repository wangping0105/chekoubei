class UserSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :created_at, :name, :phone, :is_store_user

  #string型属性
  self.stringify_keys = [:created_at, :name, :phone]
  #integer型属性
  self.integerify_keys = [:id]
  #float型属性
  self.floatify_keys = []

  def is_store_user
    !object.store_id.nil?
  end
end
