# 今天知识点

- flask框架介绍
- 示例：hello world
- 视图与路由
- 配置
- 路由信息
- 蓝图

# flask框架介绍

- web框架
- 依赖包：
    - werkzeug===》路由
    - jinja2===》模板

# 示例：hello world

- 针对一个项目，创建一个虚拟环境

# 视图与路由

- 路由规则是由werkzeug完成的，flask调用了werkzeug模块
- 说明：直接使用请求路径进行路由规则匹配
    - django中会将路由最左侧的/去掉再进行路由规则匹配

# 配置

- 设置
    - 1.新建config.py
    - 2.定义类BaseConfig，定义基本配置项
    - 3.定义类DevConfig、ProdConfig、TestCofnig等，继承自BaseConfig，重写不同的配置项
- app.config.from_object(配置类型)
- app.config.get('配置项')
- 说明：所有配置项要求字母大写

# 路由信息

- 属性url_map===>Map，里面有属性_rules列表，存储所有的路由规则
- 每条路由规则都是一个Rule类型对象
- 类视图的原理与django相同===》MethodView
- app.add_url_rule()====>为类视图添加路由规则
- flask中路由规则的组织结构
    - 方法使用app.route()装饰器
    - 类使用app.add_url_rule()方法
    - 所有路由规则存在于列表中app.url_map==>Map==>_rules===>列表
    - 每条路由规则都是Rule类型的对象
        - 路径
        - 请求方式
        - 方法名称
- 在路径中进行值提取：
    - <转换器名称:变量名称> =====》在方法中必须使用指定变量名称接收数据
- 实现原理：
    - 1.在转换器类中通过属性regex定义正则表达式
    - 2.将转换器类与键配置到转换器字典
    - 3.将转换器字典作为路由规则对象Map的属性converts
    - 4.app.router()路由规则中通过<>调用转换器
    - 5.冒号左边写转换器字典中的键，冒号右边写接收参数的名称
- werkzeug中内置的转换器（6个）
    - string
    - any
    - path
    - int
    - float
    - uuid
- 自定义转换器：
    - 定义类，继承自BaseConverter
    - 重写属性regex，指定正则表达式
    - 为app.url_map.converters添加转换器
    - 在app.route中使用<名称:变量名>

# 蓝图

- 作用：将项目按照业务逻辑拆分，封装到不同的蓝图中，相当于django中的应用
- 使用：
    - 1.新建包
    - 2.在init文件中创建蓝图
    - 3.新建views.py，定义视图
    - 4.使用蓝图注册路由
    - 5.在Flask对象上注册蓝图

# 总结

- flask依赖底层包：werkzeug，jinja2
- 路由规则的注册
    - ***.route(路径,methods=[...])
- 从路径中提取参数
    - <转换器名称:参数名称>
    - 转换器中指定了正则表达式
    - 内置6个转换器：string,any,path,int,float,uuid
    - 自定义转换器：定义类继承，重写正则表达式，注册，调用
- 蓝图注册
    - 1.创建***_bp=Blueprint(应用名称,__name__,url_prefix='')
    - 2.在views.py中注册路由规则
    - 3.注册到Flask对象
