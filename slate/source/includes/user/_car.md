# 车辆接口
## 添加车
### HTTP Request

`POST  /api/v1/users/cars`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
query | false | 查询
car_type | true | old_car or new_car

> 返回数据示例

```json
{
  "code": 0,
  "data": [
    {
      "id": 5,
      "brand_id": 1,
      "brand_name": "奥迪",
      "model_no": "T1",
      "color": "蓝色",
      "distance": 223666,
      "on_time": "2012-11-11",
      "description": "",
      "car_type": "new_car",
      "attachments": [
        {
          "id": 10,
          "file_url": "/system/attachments/files/000/000/010/original/c55d4ee1041f96fe7101df92a7ba5e76.jpg?1460126771",
          "name": "",
          "file_file_name": "c55d4ee1041f96fe7101df92a7ba5e76.jpg",
          "file_content_type": "image/jpeg",
          "file_file_size": 101506,
          "user_name": "平神",
          "attachmentable_id": 5,
          "attachmentable_type": "Car",
          "upload_time": "2016-04-08 14:46"
        }
      ]
    },
    {
      "id": 4,
      "brand_id": 1,
      "brand_name": "奥迪",
      "model_no": "T1",
      "color": "蓝色",
      "distance": 223666,
      "on_time": "2012-11-12",
      "description": "",
      "car_type": "new_car",
      "attachments": [
        {
          "id": 9,
          "file_url": "/system/attachments/files/000/000/009/original/bf4b6f7e07d56868ef2bda186579e47f.jpg?1460126521",
          "name": "",
          "file_file_name": "bf4b6f7e07d56868ef2bda186579e47f.jpg",
          "file_content_type": "image/jpeg",
          "file_file_size": 11234,
          "user_name": "平神",
          "attachmentable_id": 4,
          "attachmentable_type": "Car",
          "upload_time": "2016-04-08 14:42"
        }
      ]
    }
  ]
}
```

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
attachment_ids |false|数组
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