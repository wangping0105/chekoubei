json.code 0
json.data do
  json.user UserSerializer.new(@user)
  json.user_token @user.authentication_token
end