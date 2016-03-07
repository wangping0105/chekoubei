class AttachmentSerializer < ActiveModel::Serializer
  include NonullSerializerable
  attributes :id, :file_url, :name, :file_name, :file_content_type, :file_size, :user, :attachmentable_id, :attachmentable_type, :upload_time

  self.root = false
  #string型属性
  self.stringify_keys = [:file_url, :name, :file_name, :file_content_type, :attachmentable_type]
  #integer型属性
  self.integerify_keys = [:id, :file_size, :attachmentable_id ]
  #float型属性
  self.floatify_keys = []

  def upload_time
    object.updated_at.strftime("%F %H:%M")
  end

  def file_url
    object.file_url
  end
end
