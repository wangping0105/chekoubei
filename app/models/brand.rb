class Brand < ActiveRecord::Base

  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
