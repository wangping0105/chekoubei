class StoreCarSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :title, :prices, :store_id, :car, :status, :top

  #string型属性
  self.stringify_keys = [:created_at, :title, :prices, :status]
  #integer型属性
  self.integerify_keys = [:id]
  #float型属性
  self.floatify_keys = []

  # def store
  #   _store = object.store
  #   return {} unless _store
  #   StoreSerializer.new _store
  # end

  def car
    _car = object.car
    return {} unless _car
    CarSerializer.new _car
  end
end
