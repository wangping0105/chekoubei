# 短信验证码 SmsCode
user_id, phone, code, sms_type 短信类型

# attachments 附件表
字段名 | 描述
--------- | ------- | -----------

# stores 商户门店表
字段名 | 描述
--------- | ------- | -----------
pinyin
name | 店名
short_name | 门头
introduction | 业务简介
category | 门店类别
store_type | 门店类型 （快修 维修站）
business_hours | 营业时间
lat | 纬度
lng | 经度
level | 等级
order_count | 成单数

# store_categories 门店类别表
name
parent_id
position
path

# store_users 商户用户表
字段名 | 描述
--------- | ------- | -----------
store_id
name | 名称
phone | 电话
sex
avatar
authentication_token
password_digest
activated
admin

# orders 订单表
字段名 | 描述
--------- | ------- | -----------
order_no | 订单号
user_id | 用户id
store_id | 商户id
store_id | 门店
order_status | 订单状态


# order_pays表
字段名 | 描述
--------- | ------- | -----------
pay_no | 支付订单号
order_id | 订单号
user_id | 用户id
store_id | 门店id
pay_type | 支付类型（用户账户，支付宝）
pay_status | 支付状态

# user_accounts 用户的账户表
字段名 | 描述
--------- | ------- | -----------
user_id |
money | 余额加密
show_money | 显示余额
freezn_money | 冻结金额

# store_accounts 门店账户表
字段名 | 描述
--------- | ------- | -----------
store_id |
money | 余额加密
show_money | 显示余额
freezn_money | 冻结金额

# frends 好友关系表
字段名 | 描述
--------- | ------- | -----------
user_id |
frend_id |