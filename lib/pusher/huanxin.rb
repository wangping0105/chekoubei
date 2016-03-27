require 'singleton'
require 'httparty'  
class HuanXin
	include Singleton  
  
 
# HuanXin.instance.get_token
  def get_token
  @https_url = "https://a1.easemob.com"
  @api_path = "#{@https_url}/carkoubei/carkoubei"
  @client_id = "YXA6HIeDoPJAEeWs9gcxUaLXbg"
  @client_secret = "YXA6xG_zZCcZOhkRRsxbM-mc9PMWiFk"
	attr = {
		grant_type: "client_credentials",
		client_id: @client_id,
		client_secret: @client_secret
	}
    response = HTTParty.post "#{@api_path}/token", attr
	json_body = JSON(response.body)
  end

end
