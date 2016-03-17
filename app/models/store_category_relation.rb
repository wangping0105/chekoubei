class StoreCategoryRelation < ActiveRecord::Base
  belongs_to :store
  belongs_to :store_category
end
