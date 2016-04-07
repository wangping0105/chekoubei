class AppVersionSerializer < ActiveModel::Serializer
  include NonullSerializerable
  self.root = false

  attributes :name, :app_type, :version_name, :version_code, :download_url, :upgrade, :changelogs
  #string型属性
  self.stringify_keys = [:name, :app_type, :version_name, :version_code, :download_url, :upgrade, :changelogs]

  #integer型属性
  self.integerify_keys = []

  #float型属性
  self.floatify_keys = []
end
