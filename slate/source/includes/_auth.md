# 登录接口
## 手机验证码发送
### HTTP Request

`GET  /api/v1/auth/send_verification_code`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
sms_type | true | 类型，值 in ['signup']
code | true | 码
phone | true | 电话


> 返回正确数据

```json
{
  "code": 0
}
```
