class BrandSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :name, :logo

  #string型属性
  self.stringify_keys = [:name, :logo]
  #integer型属性
  self.integerify_keys = [:id]
  #float型属性
  self.floatify_keys = []

  def logo
    object.logo_url
  end
end
