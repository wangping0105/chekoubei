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

## 门店列表
### HTTP Request

`GET  /api/v1/users/stores`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
store_category | false | 类型id
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

## 门店车列表
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