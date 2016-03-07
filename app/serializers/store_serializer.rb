class UserSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :name, :short_name, :introduction, :category, :store_type, :business_hours, :level, :order_count, :lat, :lng,
             :address, :image_attachments, :created_at

  #string型属性
  self.stringify_keys = [:created_at, :name, :short_name, :introduction, :category, :store_type, :business_hours]
  #integer型属性
  self.integerify_keys = [:id, :level, :order_count]
  #float型属性
  self.floatify_keys = [:lat, :lng]

  def address
    return {} unless object.address
    ActiveModel::ArraySerializer.new(object.address, each_serializer: AddressSerializer)
  end

  def image_attachments
    return [] unless object.image_attachments
    ActiveModel::ArraySerializer.new(object.image_attachments, each_serializer: AttachmentSerializer)
  end
end
