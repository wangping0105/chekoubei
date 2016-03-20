class Brand < ActiveRecord::Base
  has_many :stores
  has_many :cars

  enum brand_type: {car: 0}
  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
