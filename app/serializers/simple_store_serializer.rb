class SimpleStoreSerializer < ActiveModel::Serializer
  include NonullSerializerable
  extend Geocoder::Model::ActiveRecord unless defined? Rails::Railtie

  self.root = false
  attributes :id, :name, :short_name, :introduction, :store_type, :level, :order_count, :store_category_name, :brand_name,
             :address, :image_attachments, :distance

  #string型属性
  self.stringify_keys = [:created_at, :name, :short_name, :introduction, :store_type, :store_category_name]
  #integer型属性
  self.integerify_keys = [:id, :level, :order_count]
  #float型属性
  self.floatify_keys = [:lat, :lng]

  def address
    return {} unless object.address
    SimpleAddressSerializer.new object.address
  end

  def image_attachments
    return [] unless object.image_attachments
    ActiveModel::ArraySerializer.new(object.image_attachments, each_serializer: AttachmentSerializer)
  end

  def brand_name
    object.brand.try(:name).to_s
  end

  def store_category_name
    "#{object.store_category.try(:name).to_s}店"
  end

  def distance
    if object.respond_to?(:distance) && object.distance
      if object.distance > 1
        "#{object.distance.round(2)}km"
      else
        "#{(object.distance * 1000).round(2)}m"
      end
    else
      "0m"
    end
  end
end
