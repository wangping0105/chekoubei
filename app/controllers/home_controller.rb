class HomeController < ApplicationController
  before_action :is_super_admin?
  JSON_HEADER = { "Content-Type" => "application/json" }

  def index
    @users =  User.includes(:store).order(updated_at: :desc)
    @users = filter_page(@users)
  end

  def app
    @host = "http://api.ikcrm.com"
    @host = "http://localhost:3000"

    url = "#{@host}/api/v2/auth/login"


    opts = {
      login: '15921076830',
      password: '111111',
      version_code: '3.11.0',
      device: 'ios'
    }
    @response = HTTParty.post(
      url,
      body: opts.to_json,
      headers: JSON_HEADER
    )

    @response = HashWithIndifferentAccess.new @response
    @default_url = "#{@host}/api/v2"
    @default_params = "user_token=#{@response[:data][:user_token]}&device=ios&version_code=3.11.0"

    @params= "#{@default_url}%s#{@default_params}"
    @every_get_url = every_get_url
  end

  private
  def every_get_url
    [
      {label: '报表首页', url: '/report_center?'},
      {label: '合同首页', url: '/contracts?'},
    ]
  end
end