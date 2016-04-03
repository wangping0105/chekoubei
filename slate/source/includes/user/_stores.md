# 门店相关
## 门店类型列表
### HTTP Request

`GET  /api/v1/users/store_categories`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------

> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 51,
      "name": "新车"
    },
    {
      "id": 52,
      "name": "二手车"
    },
    {
      "id": 53,
      "name": "车险"
    },
    {
      "id": 54,
      "name": "车贷"
    },
    {
      "id": 55,
      "name": "车抵押"
    }
  ]
}
```



## 门店品牌列表
### HTTP Request

`GET  /api/v1/users/stores/store_brands`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
brand_type | false | 类型 [car(车), car_insurance(车险), car_loan（车贷）, car_mortgage车抵押]
page | false | 页码
per_page | fasle | 每页数量

> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 1,
      "name": "奥迪",
      "logo":"/assets/brand_logos/aodi.png"
    },
    {
      "id": 9,
      "name": "大众",
      "logo":"/assets/brand_logos/aodi.png"
    }
  ],
  "total_count": 2,
  "per_page": 0,
  "page": 0
}
```

## 门店列表
### HTTP Request

`GET  /api/v1/users/stores`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
store_category_id | false | 类型id
brand_id | false | 品牌id
order | false | 排序方式, distance 根据距离
lat | false | 纬度
lng | false | 经度
page | false | 页码
per_page | fasle | 每页数量

> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 1,
      "name": "1号test奥迪4s店",
      "short_name": "四牌楼奥迪",
      "introduction": "专业修车一百年",
      "store_type": 0,
      "level": 1,
      "order_count": 0,
      "store_category_name": "新车店",
      "brand_name": "奥迪",
      "address": {
        "id": 1,
        "province": {},
        "city": {},
        "district": {},
        "detail_address": "宝山区高境一村138号",
        "lat": 31.3197,
        "lng": 121.477
      },
      "image_attachments": [
         {
           "id": 8,
           "file_url": "/system/attachments/files/000/000/008/original/demo_car.png?1458469347",
           "name": "",
           "file_file_name": "demo_car.png",
           "file_content_type": "image/png",
           "file_file_size": 514172,
           "user_name": "admin",
           "attachmentable_id": 4,
           "attachmentable_type": "Car",
           "upload_time": "2016-03-20 10:22"
         }
       ],
      "distance": "0m"
    }
  ],
  "total_count": 1,
  "per_page": 25,
  "page": 1
}
```

## 门店车列表(返回有门店的品牌)
### HTTP Request

`GET  /api/v1/users/stores/:id/store_car_list`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
id | true| 门店的id 替换url里的 :id, ps:/api/v1/users/stores/4/store_car_list
page | false | 页码
per_page | fasle | 每页数量

> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 4,
      "title": "",
      "prices": "",
      "store_id": 4,
      "car": {
        "id": 4,
        "brand_id": 511,
        "brand_name": "奥迪",
        "model_no": "test型号",
        "color": "绿色",
        "distance": 150000,
        "on_time": "2015-11-11",
        "description": "11111",
        "car_type": "new_car",
        "attachments": [
          {
            "id": 8,
            "file_url": "/system/attachments/files/000/000/008/original/demo_car.png?1458469347",
            "name": "",
            "file_file_name": "demo_car.png",
            "file_content_type": "image/png",
            "file_file_size": 514172,
            "user_name": "admin",
            "attachmentable_id": 4,
            "attachmentable_type": "Car",
            "upload_time": "2016-03-20 10:22"
          }
        ]
      },
      "status": "for_sale",
      "top": false
    }
  ]
}
```

## 门店车详情
### HTTP Request

`GET  /api/v1/users/stores/:id/store_car`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
id | true| url里的 :id
store_car_id | true | 关联id

> 返回数据示例

```json
{
  "code": 0,
  "data": {
      "id": 4,
      "brand_id": 511,
      "brand_name": "奥迪",
      "model_no": "test型号",
      "color": "绿色",
      "distance": 150000,
      "on_time": "2015-11-11",
      "description": "11111",
      "car_type": "new_car",
      "attachments": [
        {
          "id": 8,
          "file_url": "/system/attachments/files/000/000/008/original/demo_car.png?1458469347",
          "name": "",
          "file_file_name": "demo_car.png",
          "file_content_type": "image/png",
          "file_file_size": 514172,
          "user_name": "admin",
          "attachmentable_id": 4,
          "attachmentable_type": "Car",
          "upload_time": "2016-03-20 10:22"
      }]
    }
}
```