class Brand < ActiveRecord::Base

  after_initialize do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
