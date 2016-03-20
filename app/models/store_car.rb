class StoreCar < ActiveRecord::Base
  belongs_to :car
  belongs_to :store

  enum status: {for_sale: 0, saled: 1}
end
