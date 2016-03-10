class Brand < ActiveRecord::Base
  has_many :stores

  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
