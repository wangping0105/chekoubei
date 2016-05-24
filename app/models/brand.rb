class Brand < ActiveRecord::Base
  has_many :stores
  has_many :cars
  has_one :attachment, as: :attachmentable

  scope :car_brand, ->{where(brand_type: self.brand_types[:car])}
  scope :car_insurance_brand, ->{where(brand_type: self.brand_types[:car_insurance])}
  scope :car_loan_brand, ->{where(brand_type: self.brand_types[:car_loan])}
  scope :car_mortgage_brand, ->{where(brand_type: self.brand_types[:car_mortgage])}

  enum brand_type: {car: 0, car_insurance: 1, car_loan: 2, car_mortgage: 3 }

  before_save do
    self.pinyin = PinYin.of_string(self.name).join("") if self.name.present?
  end

  def logo_url
    return attachment.file_url if attachment.present?
    "/system/brand_logos/#{pinyin}.jpg"
  end
end
