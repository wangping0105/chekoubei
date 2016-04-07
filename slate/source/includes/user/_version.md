# 版本 Version
## 最新版本
### HTTP Request

`GET  /api/v1/users//versions/lastest_version`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
device | true | in ['android', 'ios']

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "name": "chekoubei",
    "app_type": "android",
    "version_name": "1.0.0",
    "version_code": "1.0.0",
    "download_url": "",
    "upgrade": "",
    "changelogs": ""
  }
}
```