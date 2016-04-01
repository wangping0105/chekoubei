require 'singleton'
require 'httparty'

module HuanXin
  class HuanXin
    include Singleton
    attr_accessor :https_url, :api_path, :client_id, :client_secret, :token
# uuid 1c8783a0-f240-11e5-acf6-073151a2d76e
# HuanXin.instance.get_token
    def get_token
      attr = {
        grant_type: "client_credentials",
        client_id: client_id,
        client_secret: client_secret
      }
      r = post("#{api_path}/token", attr)
    end

    def create_im_user(user = nil)
      attr = {
        username: "user#{user.try(:id).to_i}",
        password: '123456',
        nickname: user.try(:name)
      }
      r = post("#{api_path}/users", attr.merge(token: token))
      if r[:code] == "200"
        ImUser.create(attr.merge(user_id: user.try(:id)))
      else
        if r[:code]=="400" && r[:body]['error'] == "duplicate_unique_property_exists"
          ImUser.find_or_create_by(attr.merge(user_id: user.try(:id)))
        end

        p "error,#{r}"
      end
    end

    def get_im_users
      attr = {
        limit: 20
      }
      get("#{api_path}/users", attr, token)
    end

    def send_penetrate_msg(target_users, msg)
      options = {
        target_type: "users",     # users 给用户发消息,  chatgroups 给群发消息, chatrooms 给聊天室发消息
        target: target_users, # 注意这里需要用数组,数组长度建议不大于20, 即使只有
        # 一个用户u1或者群组, 也要用数组形式 ['u1'], 给用户发
        # 送时数组元素是用户名,给群组发送时数组元素是groupid
        msg:{  #消息内容
               type: "cmd",  # 消息类型
               action: "post",
               content: msg
        },
        #from:"testa",  #表示消息发送者, 无此字段Server会默认设置为"from":"admin",有from字段但值为空串("")时请求失败
        ext:{   #扩展属性, 由app自己定义.可以没有这个字段，但是如果有，值不能是“ext:null“这种形式，否则出错
                txt: msg,
                attr2: "v2"
        }
      }
      post("#{api_path}/messages", options)
    end

    private
    def post(uri, options)
      response = ""
      url = URI.parse(uri)
      Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
        req = Net::HTTP::Post.new(url.path)
        req.content_type = "application/json"
        response = http.request(req, options.to_json.to_s)
      end

      if response.code == '401'
        self.token = HuanXinInst.get_token[:body]['access_token']
      end
      {
        code: response.code,
        body: (JSON(response.body) if response.body)
      }
    end

    def get(uri, options, token)
      response = ""
      url = URI.parse(uri)
      Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
        req = Net::HTTP::Get.new(url.path)
        req.content_type = "application/json"
        req['Authorization'] = "Bearer #{token}"
        response = http.request(req, options.to_json.to_s)
      end

      if response.code == '401'
        self.token = HuanXinInst.get_token[:body]['access_token']
      end
      {
        code: response.code,
        body: (JSON(response.body) if response.body)
      }
    end
  end

  HuanXinInst = HuanXin.instance
  HuanXinInst.https_url = "https://a1.easemob.com/"
  HuanXinInst.api_path = "https://a1.easemob.com/carkoubei/carkoubei"
  HuanXinInst.client_id = "YXA6HIeDoPJAEeWs9gcxUaLXbg"
  HuanXinInst.client_secret = "YXA6xG_zZCcZOhkRRsxbM-mc9PMWiFk"
  HuanXinInst.token = HuanXinInst.get_token[:body]['access_token']
end