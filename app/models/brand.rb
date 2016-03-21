class Brand < ActiveRecord::Base
  has_many :stores
  has_many :cars

  scope :car_brand, ->{where(brand_type: self.brand_types[:car])}

  enum brand_type: {car: 0}
  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
