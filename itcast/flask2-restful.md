# 今天知识点

- 请求处理
- 响应处理
- cookie
- session
- 异常处理
- 请求钩子
- 上下文
- restful

# 请求处理

- 通过对象from flask import request

参数 | flask属性 | django属性
---|---|---
查询参数|args|GET
头|headers|META
体-表单|form|POST
体-json|data|body

# 响应处理

- 模板：render_template(模板文件名称,向模板中传递的参数)
- json：jsonify(字典)
- 重定向：redirect('url')
- 原始response对象：make_response(字符串)

# cookie

- 浏览器中保存的一段纯文本信息
- 格式：键-值
- 写方法set_cookie(键,值,max_age=以秒为单位的过期时间)
    - 过期时间默认为：会话结束，即关闭浏览器，信息会被删除
- 读方法request.cookies.get(键)
- 删方法delete_cookie(键)===>可以通过设置过期时间为0进行删除
- 基于域名安全

# session

- 写：session[键]=值
- 读：session.get(键)
- 存储位置：默认在cookie中

# 异常处理

- abort()===>抛出异常，用于调用特定的异常处理方法
- 装饰器app.errorhandlers()

# 请求钩子

- IoC===>控制反转
- before_first_request
- before_request
- after_request
- teardown_request

# 上下文

- request
- session
- current_app==>Flask(),唯一
- g===》每次请求时创建，每次响应后销毁，因用户不同而改变

# restful

- [官网文档](https://flask-restful.readthedocs.io/en/latest/)
- 视图类Resource
- 路由规则类Api
- 序列化器
- 反序列化器
- 统一的响应处理

# 总结

- request
- response
- cookie
- session
- 钩子函数
- 异常处理
- 上下文对象
- flask-restful
