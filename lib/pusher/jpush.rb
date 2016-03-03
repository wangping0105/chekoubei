# -*- encoding : utf-8 -*-
require 'digest/md5'
require 'json'
require 'rest_client'

module NotificationPush
  module JPush
    def push_message(opts ={})

      sendno = opts[:sendno] || 1

      app_key = opts[:app_key] || '.....'

      receiver_type = opts[:receiver_type] || 2

      receiver_value = opts[:receiver_value] || '1'

      master_secret = opts[:master_secret] || '......'

      title = opts[:title] || '通知'

      message = opts[:message]

      n_extras_type = opts[:n_extras_type] || '1'

      n_extras_id = opts[:n_extras_id] || '1'

      mixstring = sendno.to_s + receiver_type.to_s + receiver_value + master_secret

      md5string = Digest::MD5.hexdigest(mixstring)

      msg_content = {  "n_title" => title, "n_content" =>  message,  "n_extras" => {"ios" => {"badge" => 1, "sound" => "happy"},"type" => n_extras_type, "id" => n_extras_id }}.to_json

      RestClient.post 'http://api.jpush.cn:8800/sendmsg/v2/sendmsg', {
        :sendno => sendno,
        :app_key => app_key,
        :receiver_type => receiver_type,
        :receiver_value => receiver_value,
        :verification_code => md5string,
        :msg_type => 1,
        :msg_content => msg_content,
        :platform => 'ios,android'
      }
    end
  end
end