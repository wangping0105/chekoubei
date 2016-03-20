class CarSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :brand_id, :brand_name, :model_no, :color, :distance, :on_time, :description, :car_type, :attachments

  #string型属性
  self.stringify_keys = [:model_no, :color, :distance, :description]
  #integer型属性
  self.integerify_keys = [:id, :brand_id, :car_type]
  #float型属性
  self.floatify_keys = []

  def brand_name
    object.brand.try(:name).to_s
  end

  def on_time
    object.on_time.to_s
  end

  def attachments
    _attachments = object.attachments
    return [] if _attachments.blank?
    ActiveModel::ArraySerializer.new(_attachments, each_serializer: AttachmentSerializer)
  end
end
