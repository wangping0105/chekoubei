#= attachments 附件
字段名 | 描述
--------- | ------- | -----------

#= store 门店
字段名 | 描述
--------- | ------- | -----------
store_name | 店名
address | 地址
introduction | 业务简介

#= store_users 商户
字段名 | 描述
--------- | ------- | -----------
name | 名称
phone | 电话
admin | true or false


#= orders 订单
字段名 | 描述
--------- | ------- | -----------
order_no | 订单号
user_id | 用户id
store_id | 门店
order_status | 订单状态


#= order_pays
字段名 | 描述
--------- | ------- | -----------
pay_no | 支付订单号
order_id | 订单号
user_id | 用户id
store_id | 门店
pay_type | 支付类型（现金，支付宝）
pay_status | 支付状态


#= merchant_accounts 商户账户
字段名 | 描述
--------- | ------- | -----------
money | 余额加密
show_money | 显示余额
freezn_money | 冻结金额