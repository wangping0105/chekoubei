class UserSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :name, :phone, :is_store_user, :identify_status, :file_url, :tags, :im_user, :created_at

  #string型属性
  self.stringify_keys = [:created_at, :name, :phone]
  #integer型属性
  self.integerify_keys = [:id]
  #float型属性
  self.floatify_keys = []

  def is_store_user
    !object.store_id.nil?
  end

  def file_url
    return "" unless object.attachment
    object.attachment.file_url
  end

  def tags
    object.tags.map(&:name)
  end

  def im_user
    return {} unless object.im_user
    {
      username: object.im_user.username,
      password: object.im_user.password,
      nickname: object.im_user.nickname.to_s
    }
  end

  def identify_status
    return object.identify_status if object.ok?
    if object.try(:auth_apply).try(:untreated?)
      "applying"
    else
      object.identify_status
    end
  end
end