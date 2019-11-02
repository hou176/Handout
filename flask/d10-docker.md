# 复习

- nginx
- 静态文件服务器
    - 全局配置段
    - http
    - server
    - location
- 反向代理
    - proxy_pass http://
    - uwsgi_pass socket
    - upstream 集群
    - 负载均衡策略：轮询，加权轮询，ip_hash，least_conn，fair，url_hash

# 反馈

# 今天知识点

- docker介绍
- 安装
- 镜像管理
- 容器管理
- 仓库管理
- 数据管理
- 网络管理
- Dockerfile

# docker介绍

- 硬件虚拟化
    - 虚拟机====>vmware
    - 容器======>docker
- 用途：将开发中需要的软件进行打包，在服务器布署方便

# 安装

- 在线
- 离线

# 仓库管理

- 仓库：存储镜像文件的地方
- 公有：https://hub.docker.com/
- 私有：自己在公司内部搭建
- 下载：docker pull 镜像:版本
- 上传：docker push 镜像:版本

# 镜像管理

- 是什么？
    - 答：一个文件，这个文件中包含操作系统、硬件驱动、软件
- 访问方式：
    - 名称:版本，如果版本是latest可以省略
    - 标识
- 查看：docker images
- 历史：docker history 名称
- 改名：docker tag 旧名称 新名称
- 删除：docker rmi 名称
- 导出：docker save 名称 > 文件名.tar
- 导入：docker load < 文件名.tar

# 容器管理

- 是什么？
    - 镜像在虚拟硬件上运行后得到的操作系统+软件
- 查看：docker ps -a
- 创建：docker run
- 启动：docker start 名称
- 停止：docker stop 名称
- 交互：docker exec
- 删除：docker rm
    - docker prune
    - docker rm -f
- 提交：docker commit -m '' -a '' 容器名称 镜像名称:版本

# 手动创建镜像

- 制作
    - 1.下载docker pull
    - 2.运行docker run
    - 3.交互docker exec
    - 4.进行定制修改
    - 5.提交docker commit
    - 6.导出docker save
- 使用
    - 1.拷贝
    - 2.导入docker load 
    - 3.docker images
    - 4.docker run -dit --name=n3 编号 /bin/bash
    - 5.ls===>cat hello.txt

# 数据管理

- 硬盘虚拟化
- 文件
- 目录
- 目的
    - 1.如果容器操作系统坏掉，但是数据可以成功保留
    - 2.在宿主机中编辑文件，在容器操作系统中可以识别，编辑更方便
- 实现

```
docker run ... -v 宿主机目录或文件:容器目录或文件
```

# 网络管理

- 网卡虚拟化
    - 端口:-P -p
    - ip：bridge,host,container,none,overlay
- 总结：使用最多最简单的方式===》--net=host
    - 容器的ip与宿主机ip相同
    - 端口保持相同

# Dockerfile

- 自动化创建镜像的方法
- 在空目录中新建文件Dockerfile，文件名称固定
    - FROM
    - MAINTAINER
    - ENV
    - RUN
    - ADD
    - COPY
    - WORKDIR
    - EXPOSE
    - VOLUME
    - ENTRYPOINT
- 执行流程：docker build -t 镜像名称:版本 Dockerfile文件所在目录
    - 找到镜像
    - 创建容器
    - 执行命令
    - 提交容器，得到镜像
    - 删除容器

# 总结项目中需要的技术

- django===>uwsgi
- nginx
- mysql
- redis
- fastdfs
- elasticsearch-ik

# 总结

### 重要知识点

- docker
- 仓库
- 镜像
- 容器
- Dockerfile

### 作业

- 总结、练习命令

### 大纲要求

- 写出 docker镜像日常指令

```
docker pull/push
docker load/save
docker images
docker rmi
```

- 写出 docker容器日常指令

```
docker run ...
docker ps -a
docker exec
docker start/stop
docker rm
```

- 知道COPY和ADD的区别

```
Dockerfile
ADD====》复制目录
COPY===》复制文件
```
