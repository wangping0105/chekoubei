class Api::V1::AuthController < Api::V1::BaseController
  skip_before_action :authenticate!, only: [:login, :send_verification_code]

  def login
    login_field = params[:login].include?("@") ? :email : :phone
    @user = User.with_database_authentication(login_field => params[:login]).first
    if @user && @user.authenticate(params[:password])
      @user.update_authentication_token
    else
      render json: { code: -1, message: "帐号或者密码错误" }
    end
  end

  # 发送验证码
  def send_verification_code
    param! :sms_type, String, required: true, in: ['signup']
    param! :code, String, required: true
    param! :phone, String, required: true

    code, phone = params[:code], params[:phone]
    sms = SmsCode.find_or_create_by(sms_type: params[:sms_type], phone: phone)
    sms.code = code
    if sms.save
      result = Alidayu::Sms.send_code_for_sign_up(code, phone)
      if result['error_response'].present?
        render json: { code: -1,  message: result['error_response']['sub_msg'] }
      else
        render json: { code: 0}
      end
    else
      render json: { code: -1, message: "帐号或者密码错误" }
    end
  end

  def logout

  end

  def ping
    render json: { code: 0, message: "pong" }
  end
end
