class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  has_one :store_car
  has_one :store, through: :store_car

  enum car_type: {new_car: 0, old_car: 1}
end