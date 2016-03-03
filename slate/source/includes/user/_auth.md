# 用户登录接口
## 登录
### HTTP Request

`POST  /api/v1/users/auth/login`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
phone | true | 电话
password | true | mi码

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "user": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false
    },
    "user_token": "019c0438d2843820d087db7ba1a41b33da97500d"
  }
}
```

## 手机验证码发送
### HTTP Request

`GET  /api/v1/users/auth/send_verification_code`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
sms_type | true | 类型，值 in ['signup']
code | true | 码
phone | true | 电话


> 返回数据示例

```json
{
  "code": 0
}
```

## 注册
### HTTP Request

`POST  /api/v1/users/auth/sign_up`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
code | true | 验证码
phone | true | 电话
password | true | mi码

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "user": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false
    },
    "user_token": "019c0438d2843820d087db7ba1a41b33da97500d"
  }
}
```


