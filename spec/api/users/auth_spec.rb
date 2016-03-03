require 'rails_helper'

RSpec.describe "auth", type: :request do

  before(:all) do
    @user         = create(:user)
    @default_params  = { user_token: @user.authentication_token, version_code: VERSION_CODE }
    @default_params_without_user_token  = { version_code: VERSION_CODE }
    @auth_path   = "#{USERS_API_PREFIX}/auth"
  end

  context 'auth login' do
    it "success!" do
      post "#{@auth_path}/login", **@default_params_without_user_token, phone: @user.phone, password: '111111'
      json_body = JSON(response.body)

      expect(response.status).to eq(200)
      expect(json_body['code']).to eq(0)
      expect(json_body['data']['user']['id']).to eq(@user.id)
    end
  end
end
