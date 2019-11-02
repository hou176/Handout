# 复习

- 反序列化保存
    - 在序列化器类中定义create()、update()方法
    - 增加调用：（data=***）
    - 修改调用：(模型类对象,请求数据)
    - 序列化器对象.save()
- APIView
    - Request
    - Response
    - 统一异常处理
    - 验证、检查、限流
- GenericAPIView+5个ModelMixin
    - list
    - create
    - retrieve
    - update
    - destroy
    - 属性queryset
    - 属性serializer_class

# 反馈

- 如何添加、修改英雄的图书
    - 指定hbook_id，而不是hbook
    - hero.hbook=BookInfo对象
    - hbook:{id:...,htitle:...}
    - 总结1：多端对象添加时，需要定义隐藏外键***_id
    - 总结2：不能使用hbook传递，因为这是字典，不是python对象
- ***	希望老师讲一下导包的层级，从哪里导，怎么导是正确的包
    - from rest_framework import serializers
    - from rest_framework.views import APIView
    - from rest_framework import generics
    - from rest_framework import mixins
- ***	GenericAPIView还有点懵
    - 属性queryset
    - 属性serializer_class
- ***	老师课堂讲的很细，笔记也非常好。只是 不知道是录屏软件原因，还是老师讲话的原因。录制的视频一旦倍速播放 就有些听不清了
    - 录频软件
- ***	懵逼树上懵逼果，懵逼树下你和我，懵逼的键盘敲啊敲，烦恼多啊多。 skrrr~~~
- ***	老师可不可以用话筒 上课才有激情嘛。
- 贾旭光	岐哥讲的挺好，条理分明,层次清晰
- 金磊	晕晕乎乎 明天自习走一遍吧

# 今天知识点

- ViewSet
- router
- 其他功能
- 组件语法
- 特殊属性
- 单文件组件

# ViewSet

- 视图集：多个视图的集合
    - 将原来多个视图中的代码合并到一个视图中
- 问题：方法名称不能相同
- 解决：修改方法名称
- 新问题：方法如何与请求对应
- 新解决：重写as_view()，接收字典作为参数，字典中指定请求方式与方法名称的对应关系
- 类ModelViewSet:查多，创建，查一，修改，删除
- 类ReadOnlyModelViewSet：查多，查一
- 类DefaultRouter：辅助视图集生成路由规则
- 装饰器action
    - 结合视图集+路由生成器一起使用
    - 参数methods=[]指定请求方式
    - 参数detail===>是否接收主键进行操作

# 视图小结

- APIView
- GenericAPIView+5个ModelMixin
- 视图集：ModelViewSet，ReadOnlyModelViewSet

# 其他功能

- 继承自APIView
    - 认证方式
    - 权限
    - 限制访问次数
- 继承自GenericAPIView
    - 过滤===》缺点：不支持模糊查询
    - 排序
    - 分页
- 统一的异常处理方法
- 自动生成文档

# 组件语法

- 作用：封装html、css、js代码
- 全局
- 局部
- 嵌套注册

# 特殊属性

- data
- props
- 单个根元素
- this.$emit(自定义事件)

# 单文件组件

- 创建组件工程
- 目录结构
- 调用结构
- 启动Element-ui
- 说明：在冒号后面、小括号前面、大括号前面需要加空格，否则编译报错
- 跳转
    - <router-link to=''></router-link>
    - this.$router.push({path:''})
- 编译:npm run build

# npm运行报错

- [解决方案文档](https://stackoverflow.com/questions/29492240/error-cannot-find-module-webpack)
- 命令

```
npm install --save-dev webpack
npm install --save-dev webpack-dev-server
```

# 项目初始环境

- 使用自己开发的前台项目
- 拷贝、解压、运行后台前端项目

# 总结

### 知识点

- 视图集类
    - ModelViewSet
    - ReadOnlyModelViewSet
- 生成路由规则DefaultRouter
- 装饰器action

### 作业

- 完成今天代码
- 搭建项目环境

### 大纲要求

- 能够知道认证的使用方法

```
配置
最常用：session
```

- 能够知道权限的使用方法

```
配置
4种
```

- 能够知道组件基本结构

```
template
script
style
```

- 能够使用路由或者嵌套拼装组件

```
router-link链接
this.$router.push()
```
