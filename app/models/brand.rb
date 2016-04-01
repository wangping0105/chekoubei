class Brand < ActiveRecord::Base
  has_many :stores
  has_many :cars

  scope :car_brand, ->{where(brand_type: self.brand_types[:car])}

  enum brand_type: {car: 0, car_insurance: 1, car_loan: 2, car_mortgage: 3 }

  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
