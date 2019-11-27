# 命令行客户端MySQL的使用

**学习目标**

* 能够知道使用命令行连接数据库命令
* 能够写出增、删、改、查的SQL语句

---




### 5. 小结

* 登录数据库: mysql -uroot -p
* 退出数据库: quit 或者 exit 或者 ctr + d
* 创建数据库: create database 数据库名 charset=utf8;
* 使用数据库: use 数据库名;
* 删除数据库: drop database 数据库名;
* 创建表: create table 表名(字段名 字段类型 约束, ...);
* 修改表-添加字段: alter table 表名 add 字段名 字段类型 约束
* 修改表-修改字段类型: alter table 表名 modify 字段名 字段类型 约束
* 修改表-修改字段名和字段类型: alter table 表名 change 原字段名 新字段名 字段类型 约束
* 修改表-删除字段: alter table 表名 drop 字段名;
* 删除表: drop table 表名;












