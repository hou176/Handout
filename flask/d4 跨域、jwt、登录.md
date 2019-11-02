# 复习

- 视图集
    - ModelViewSet
    - ReadOnlyModelViewSet
- 路由类
    - DefaultRouter
    - SimpleRouter
- 装饰器action：为视图集增加新的方法
- 扩展功能：
    - 认证方式
    - 权限判断
    - 访问控制
    - 过滤
    - 排序
    - 分页
    - 统计的异常处理方法
    - 文档
- Vue组件
    - 安装环境

# 反馈

- 杨杰	'AutoSchema' object has no attribute 'get_link' 老师这个bug让我无从寻找
    - 出错原因：drf版本
    - 解决：配置
    - 思路：搜索

# 今天知识点

- 后台项目需求说明
- 管理员登录

# 后台项目需求说明

- [仓库地址](https://gitee.com/python20170908/meiduo_admin_sy28/commits/heima)
- 站在使用者的角度：
    - 前台：客户
    - 后台：商家，客服
- 站在开发者的角度：
    - 前端：web，android，ios
    - 后端：服务器端，如django
- 需要实现的功能：
    - 管理员登录
    - 首页统计
    - 用户管理
    - 商品管理：规格，SKU，图片
    - 订单
    - 权限

# 管理员登录

- 创建超级用户

```
python manage.py createsuperuser
```

- 用户名：admin123
- 密码：python123

### 浏览器的同源策略

- 当浏览器中的js发起请求时，浏览器会进行同源判断
- 标准：协议、域名、端口
- 如果同源则继续请求
- 如果不同源，浏览器会发起options方式的请求，试探资源是否允许访问、是否安全
- 修改constants.js中的代码

```
	apis:'http://www.meiduo.site:8000/meiduo_admin' // 远程地址
```

### 跨域CORS

- 未正常响应options时的响应报文

```
HTTP/1.0 200 OK
Date: Fri, 11 Oct 2019 01:49:31 GMT
Server: WSGIServer/0.2 CPython/3.5.2
Content-Type: text/html; charset=utf-8
```

- 正常响应options时的响应报文

```
HTTP/1.0 200 OK
Date: Fri, 11 Oct 2019 01:50:33 GMT
Server: WSGIServer/0.2 CPython/3.5.2
Content-Type: text/html; charset=utf-8

Access-Control-Max-Age: 86400
Access-Control-Allow-Methods: DELETE, GET, OPTIONS, PATCH, POST, PUT
Access-Control-Allow-Origin: http://127.0.0.1:8080
Vary: Origin
Access-Control-Allow-Headers: accept, accept-encoding, authorization, content-type, dnt, origin, user-agent, x-csrftoken, x-requested-with
Access-Control-Allow-Credentials: true
```

- 代码实现
    - 安装包cores
    - 注册
    - 添加中间件
    - 配置白名单

### JWT

- [官网](http://www.jwt.io/)
- 构成：
    - header：类型，算法，固定不变
    - payload：用户身份数据
    - signature：加密字符串，用于验证有效性
- 有效性
    - 对比signature
    - 关键：secret

### drf-jwt

- 视图：登录
- 问题1：自定义响应体
- 问题2：自定义载荷
- 问题3：登录验证管理员

# 登录

### 自定义响应体

- 1.自定义方法
- 2.配置

### 自定义载荷

- 1.自定义方法
- 2.配置

### 自定义验证

- 读源码
- 实现：调用django认证模块的authenticate()方法
- 视图类===》post方法===》序列化器类===》validate()方法===》authenticate()方法===》配置文件中的认证类型====》自定义认证类型
- 说明：判断是前台调用，还是后台调用

# 总结

### 重要知识点

- 浏览器的同源策略
- 解决ajax跨域：响应options请求，在响应报文体中加入Access-Control-***
- token====>jwt====>drf-jwt
- 修改自定义认证方法

### 作业

- 完成今天代码
- 阅读drf-jwt文档

### 大纲要求

- 能够知道如何解决cors跨域问题

```
响应options请求
在响应报文头加入Access-Control-***
```

- 知道JWT的三部分构成

```
header=====>固定，类型，算法
payload====》用户数据
signature===》加密字符串，用于验证口令的有效性
```

- 知道JWT实现登录的业务逻辑

```
1.视图接收post请求
2.调用序列化器验证正确性
3.调用django的认证方法authenticate()
4.读取配置文件中的认证后端
5.调用认证后端对象的authenticate()方法
```
