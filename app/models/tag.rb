class Tag < ActiveRecord::Base
  has_many :user_tag

  enum tag_type: {user_tag: 0}

  validates_uniqueness_of :name

  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end
end
