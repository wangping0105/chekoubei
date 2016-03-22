# 用户相关接口
## 认证申请
### HTTP Request

`POST  /api/v1/users/users/auth_apply`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
true_name | true | 真实姓名
job |  true | 工作职位
invite_phones[] | true | 邀请手机 数组哦

> 返回数据示例

```json
{
  "code": 0
}
```