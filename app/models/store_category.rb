class StoreCategory < ActiveRecord::Base
  has_many :store_category_relations
  has_many :stores, through: :store_category_relations
end
