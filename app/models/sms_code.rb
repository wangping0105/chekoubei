class SmsCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :store_user
  enum :sms_types => { sign_up: 0, change_pwd: 1 }
end
