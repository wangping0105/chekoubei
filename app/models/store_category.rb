class StoreCategory < ActiveRecord::Base
  # has_many :store_category_relations 一个门店对应一个类型
  has_many :stores  #, through: :store_category_relations 一个门店对应一个类型
end
