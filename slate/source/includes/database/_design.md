# 短信验证码 SmsCode
user_id, phone, code, sms_type 短信类型

# attachments 附件表
字段名 | 描述
--------- | ------- | -----------

# addresses 地理位置表
字段名 | 描述
--------- | ------- | -----------
:lat | 纬度
:lng | 经度
:addressable_id | 关联id
:addressable_type | name
:country_id | 国家
:province_id | 省
:city_id | 市
:district_id | 区
:detail_address | 详细地址
:tel |
:phone |
:url

#= store 门店
字段名 | 描述
--------- | ------- | -----------
name | 店名
introduction | 业务简介
:pinyin | 业务简介
:short_name | 简称
:category | 类型
:store_type | 类别（维修店，快修店）
:business_hours | 营业时间
:level | 等级
:order_count | 成单数
:lat | 纬度
:lng | 经度

#= users 用户表
字段名 | 描述
--------- | ------- | -----------
store_id | 商户id
name | 名称
:phone | 名称
:sex | 性别
:avatar  | 头像
:authentication_token, index: true
:password_digest
:activated | 是否激活
:admin | 是否管理员
:deleted_at

# store_categories 门店类别表
字段名 | 描述
--------- | ------- | -----------
name | 名称
parent_id
position
path

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