require 'rails_helper'

RSpec.describe "user", type: :request do

  before(:all) do
    @user         = create(:user)
    @default_params  = { version_code: VERSION_CODE, user_token: @user.api_key.access_token }
    @user_path   = "#{USERS_API_PREFIX}/users"
  end

  context '更新用户' do
    it "成功!" do
      put "#{@user_path}/#{@user.id}", **@default_params.merge(user: {name: "测试更新"})
      json_body = JSON(response.body)

      expect(response.status).to eq(200)
      expect(json_body['code']).to eq(0)
    end
  end

  context 'show用户' do
    it "成功!" do
      get "#{@user_path}/#{@user.id}", **@default_params
      json_body = JSON(response.body)

      expect(response.status).to eq(200)
      expect(json_body['code']).to eq(0)
    end
  end
end
