---
title: PostgreSQL 10.1 手册
---

***PostgreSQL 全球开发组***

翻译：[彭煜玮](http://www.pengyuwei.net/)， [瀚高软件](http://www.highgo.com/) 及其他贡献者

版权 © 1996-2016 The PostgreSQL Global Development Group

[Legal Notice](https://www.postgresql.org/docs/10/legalnotice.html)

<hr>

## 摘要

《PostgreSQL 10.1手册》基于上一版本的 [《PostgreSQL9.6.0中文手册》](http://www.postgres.cn/docs/9.6) 翻译。翻译工作主要由瀚高软件的韩悦悦完成， 详细请参考 PostgreSQL 10 中文手册的翻译。 如果发现中文手册中的问题请向 [Github](https://github.com/postgres-cn/pgdoc-cn) 源码仓库或 PostgreSQL 中文手册翻译小组 QQ 群 (309292849) 反馈,也可直接向 [Github](https://github.com/postgres-cn/pgdoc-cn) 源码仓库提交 PR。

中文手册版本: 1.0  最后更新时间: 2019-10-10

## 目录

* [前言](/zh-cn/docs/preface/preface.html)
  * [什么是 PostgreSQL？](/zh-cn/docs/preface/intro-whatis.html)
  * [PostgreSQL 简史](/zh-cn/docs/preface/history.html)
  * [约定](/zh-cn/docs/preface/notation.html)
  * [进一步的信息](/zh-cn/docs/preface/resources.html)
  * [缺陷报告指南](/zh-cn/docs/preface/bug-reporting.html)
* I. 教程
  * 从头开始
  * SQL 语言
  * 高级特性
* II. SQL 语言
  * SQL 语法
  * 数据定义
  * 数据操纵
  * 查询
  * 数据类型
  * 函数和操作符
  * 类型转换
  * 索引
  * 全文搜索
  * 并发控制
  * 性能提示
  * 并行查询
* III. 服务器管理
  * 从源代码安装
  * 在 Windows 上从源代码安装
  * 服务器设置和操作
  * 服务器配置
  * 客户端认证
  * 数据库角色
  * 管理数据库
  * 本地化
  * 日常数据库维护工作
  * 备份和恢复
  * 高可用、负载均衡和复制
  * 恢复配置
  * 监控数据库活动
  * 监控磁盘使用
  * 可靠性和预写式日志
  * 逻辑复制
  * 回归测试
* IV. 客户端接口
  * libpq - C 库
  * 大对象
  * ECPG - C 中的嵌入式 SQL
  * 信息模式
* V. 服务器编程
  * 扩展 SQL
  * 触发器
  * 事件触发器
  * 规则系统
  * 过程语言
  * PL/pgSQL - SQL 过程语言
  * PL/Tcl - Tcl 过程语言
  * PL/Perl - Perl 过程语言
  * PL/Python - Python 过程语言
  * 服务器编程接口
  * 后台工作者进程
  * 逻辑解码
  * 复制进度追踪
* VI. 参考
* I. SQL 命令
* II. PostgreSQL 客户端应用
* III. PostgreSQL 服务器应用
* VII. 内部
  * PostgreSQL 内部概述
  * 系统目录
  * 前端/后端协议
  * PostgreSQL 编码习惯
  * 本国语言支持
  * 编写一个过程语言处理器
  * 编写一个外部数据包装器
  * 编写一种表采样方法
  * 编写一个自定义扫描提供者
  * 遗传查询优化器
  * 索引访问方法接口定义
  * 通用 WAL 记录
  * GiST 索引
  * SP-GiST 索引
  * GIN 索引
  * BRIN 索引
  * 数据库物理存储
  * BKI 后端接口
  * 规划器如何使用统计信息
* VIII. 附录
  * PostgreSQL 错误代码
  * 日期/时间支持
  * SQL 关键词
  * SQL 符合性
  * 版本说明
  * 额外提供的模块
  * 额外提供的程序
  * 外部项目
  * 源代码仓库
  * 文档
  * 首字母缩写词
* 参考书目
* 索引
