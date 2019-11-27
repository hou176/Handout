
## 1.Haystack安装

```bash
$ pip install django-haystack
$ pip install elasticsearch==2.4.1
```

## 2.Haystack注册应用和路由

```python
INSTALLED_APPS = [
    'haystack', # 全文检索
]
```
> 总路由配置
```python
url(r'^search/', include('haystack.urls')),
```

#### 3.Haystack配置-settings.dev.py
* 在配置文件中配置Haystack为搜索引擎后端

```python
# Haystack
HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.elasticsearch_backend.ElasticsearchSearchEngine',
        'URL': 'http://192.168.90.171:9200/', # Elasticsearch服务器ip地址，端口号固定为9200
        'INDEX_NAME': 'meiduo', # Elasticsearch建立的索引库的名称
    },
}

# 当添加、修改、删除数据时，自动生成索引
HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
```

> **重要提示：**
* **HAYSTACK_SIGNAL_PROCESSOR** 配置项保证了在Django运行起来后，有新的数据产生时，Haystack仍然可以让Elasticsearch实时生成新数据的索引
