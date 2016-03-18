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