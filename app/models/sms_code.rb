class SmsCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :store_user
  enum :sms_types => { signup: 0 }
end
