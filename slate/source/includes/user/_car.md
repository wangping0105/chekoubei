# 车辆接口
## 添加车
### HTTP Request

`POST  /api/v1/users/cars`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
:brand_id |true | 品牌id
:model_no |true | 型号 string
:color |true | 颜色
:distance|true | 里程
:on_time |true | 上牌日期 ps: 2015-11-15
:description | true | 描述
:car_type | true | new_car, old_car

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
        }
      ]
  }
}
```

## 车辆型号列表(全部返回)
### HTTP Request

`GET  /api/v1/users/brands`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------


> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 512,
      "name": "AC Schnitzer"
    }
  ]
}
```