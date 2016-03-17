#= attachments 附件
字段名 | 描述
--------- | ------- | -----------

#= store 门店
字段名 | 描述
--------- | ------- | -----------
store_name | 店名
address | 地址
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

# cars 车辆
字段名 | 描述
--------- | ------- | -----------
user_id | 用户id
brand_id | 车辆品牌id
model_no | 型号
color| 11
distance | 111
on_time | 上牌时间
description | 描述 text
car_type | 新车 二手车

# store_cars
字段名 | 描述
--------- | ------- | -----------
store_id | 1
car_id | 1
prices | 价格
status | 状态 卖光了,未出售


#= store_users 商户账户
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