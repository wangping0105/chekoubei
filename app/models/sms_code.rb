class SmsCode < ActiveRecord::Base
  belongs_to :user
  enum :sms_types => {
         signup: 0
       }
end
