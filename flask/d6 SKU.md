# 复习

- 统计===》APIView
- 用户管理：
    - 查询多个===>ListModelMixin
    - 创建======>CreateModelMixin
    - ListCreateAPIView
    - ModelSerializer,Serializer
    - 自定义序列化器的create()===>密码进行加密
- 规格的管理
    - ModelViewSet
    - ModelSerializer

# 反馈

- ***	相信您的建议，一定可以一针见血（不支持富文本）
- ***	敲了一天代码，收获满满。
- 分页
    - 配置在dev.py中则全局有效
    - 配置在类中则只对当前类生效

# 今天知识点

- SKU管理

# SKU管理

- ModelViewSet
- ModelSerializer

### 查询多个

- 查询所有SKU
- 分页
- 过滤：接收查询参数中的keyword，在标题、副标题中进行查找

### 增加

- 查询：所有第三级分类，供下拉列表选择使用
- 查询：根据spu查询所有规格，返回规格及所有选项
- 创建：
    - 问题：经测试，只向sku表中添加数据，没有添加sku规格数据
    - 分析：序列化器中的create()方法完成创建，则这个方法不完整
    - 解决：重写序列化器的create()方法
- 事务===》innodb

操作 | mysql | django
---|---|---
开启 | begin | sid=transaction.savepoint()
提交 | commit | transaction.savepoint_commit(sid)
回滚 | rollback | transaction.savepoint_rollback(sid)

- 禁止自动提交：with transaction.atomic():
- 生成静态文件

### 查询一个

- RetrieveModelMixin

### 修改

- 重写序列化器的update()方法
    - 1.修改sku对象
    - 2.修改规格数据
    - 3.事务
    - 4.生成静态文件

### 删除

- DestroyModelMixin
- 外键设置为级联，表示：删除时相关表的数据会被一起删除

# 总结

### 重要知识点

- ModelViewSet
- ModelSerializer
- 重写序列化器的create()、update()方法
    - 维护一对多关系中，多表中的数据
- 事务
- 异步任务

### 作业

- 完成今天代码

### 大纲要求

- 能够理解获取sku商品三级分类的代码逻辑

```
当前分类表中共三级分类数据
第一级分类特点：没有上级parent__isnull=True
第三级分类特点：没有子级subs__isnull=True
第二级分类特点：上级、子级都不为空，parent__isnull=False,subs__isnull=False
```

- 能够理解获取spu表规格和规格选项数据的业务逻辑

```
1.从请求路径中获取spu_id===>self.kwargs.get('pk')
2.查询SPUSpec.objects.filter(spu_id=***)
3.通过序列化器输出
4.隐藏关系属性options，通过自定义序列化器输出
```

- 能够知道改写sku序列化器create方法的原因

```
当前需要实现的功能：
    1.创建sku对象
    2.创建sku规格对象
    3.生成静态文件
序列化器中的create()方法只能实现第1个功能，所以需要重写此方法，完成2、3功能
```
