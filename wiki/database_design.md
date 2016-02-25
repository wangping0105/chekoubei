#= 短信验证码 SmsCode
user_id, phone, code, sms_type 短信类型

#= attachments 附件
字段名 | 描述
--------- | ------- | -----------


#= merchants 商户
字段名 | 描述
--------- | ------- | -----------
merchant_name | 商户名

#= store 门店
字段名 | 描述
--------- | ------- | -----------
store_name | 店名
address | 地址
introduction | 业务简介

#= merchant_users 商户
字段名 | 描述
--------- | ------- | -----------
name | 名称
phone | 电话


#= orders 订单
字段名 | 描述
--------- | ------- | -----------
order_no | 订单号
user_id | 用户id
merchant_id | 商户id
store_id | 门店
order_status | 订单状态


#= order_pays
字段名 | 描述
--------- | ------- | -----------
pay_no | 支付订单号
order_id | 订单号
user_id | 用户id
merchant_id | 商户id
store_id | 门店
pay_type | 支付类型（用户账户，支付宝）
pay_status | 支付状态

#= user_accounts 用户的账户
字段名 | 描述
--------- | ------- | -----------
user_id
money | 余额加密
show_money | 显示余额
freezn_money | 冻结金额

#= merchant_accounts 商户账户
字段名 | 描述
--------- | ------- | -----------
money | 余额加密
show_money | 显示余额
freezn_money | 冻结金额