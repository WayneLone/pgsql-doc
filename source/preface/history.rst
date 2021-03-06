*************************************
2. PostgreSQL 简史
*************************************

现在被称为 PostgreSQL 的对象-关系型数据库管理系统是从加州大学伯克利分校写的 POSTGRES 软件包发展而来的。
经过二十多年的发展，PostgreSQL 是世界上可以获得的最先进的开源数据库。

2.1. 伯克利的 POSTGRES 项目
=====================================

由 Michael Stonebraker 教授领导的 POSTGRES 项目是由防务高级研究项目局（DARPA）、陆军研究办公室（ARO）、
国家科学基金（NSF） 以及 ESL, Inc 共同赞助的。 POSTGRES 的实现始于 1986 年。该系统最初的概念详见 `[ston86]`_。
最初的数据模型定义见 `[rowe87]`_。当时的规则系统设计在 `[ston87a]`_ 里描述。存储管理器的理论基础和体系结构在 `[ston87b]`_ 里有详细描述。

从那以后，POSTGRES经历了几次主要的版本更新。第一个“演示性”系统在 1987 年便可使用了，
并且在 1988 年的 ACM-SIGMOD 大会上展出。在 1989 年 6 月发布了版本 1（见 `[ston90a]`_）给一些外部的用户使用。
为了回应用户对第一个规则系统（`[ston89]`_）的批评，
规则系统被重新设计了（`[ston90b]`_），在 1990 年 6 月发布了使用新规则系统的版本 2。
版本 3 在 1991 年出现，增加了多存储管理器的支持， 并且改进了查询执行器、重写了规则系统。
直到 Postgres95 发布前（见下文）的后续版本大多把工作都集中在移植性和可靠性上。

POSTGRES 已经被用于实现很多不同的研究和生产应用。这些应用包括： 一个财务数据分析系统、一个喷气引擎性能监控软件包、
一个小行星跟踪数据库、一个医疗信息数据库和一些地理信息系统。POSTGRES 还被许多大学用于教学用途。
最后，Illustra Information Technologies（后来并入 `Informix`_，而 `Informix`_
现在被 `IBM <https://www.ibm.com/>`_ 所拥有）拿到代码并使之商业化。
在 1992 年末 POSTGRES 成为 `Sequoia 2000 <http://meteora.ucsd.edu/s2k/s2k_home.html>`_ 科学计算项目的主要数据管理器。

在 1993 年间，外部用户社区的数量几乎翻番。随着用户的增加，用于源代码维护的时间日益增加并占用了太多本应该用于数据库研究的时间，
为了减少支持的负担，伯克利的 POSTGRES 项目在版本 4.2 时正式终止。

.. _Informix: https://www.ibm.com/analytics/informix

2.2. Postgres95
=====================================

在 1994 年，Andrew Yu 和 Jolly Chen 向 POSTGRES 中增加了 SQL 语言的解释器。
并随后用新名字 Postgres95 将源代码发布到互联网上供大家使用，成为最初 POSTGRES 伯克利代码的开源继承者。

Postgres95 的源代码都是完全的 ANSI C，而且代码量减少了 25%。许多内部修改提高了性能和可维护性。
Postgres95 的 1.0.x 版本在进行 Wisconsin Benchmark 测试时大概比 POSTGRES 的版本 4.2 快 30-50%。
除了修正了一些错误，下面的是一些主要提升：

* 原来的查询语言 PostQUEL 被 SQL 取代（在服务器端实现）。接口库 `libpq <https://www.postgresql.org/docs/12/libpq.html>`_ 被按照 PostQUEL 命名。
  在PostgreSQL之前还不支持子查询（见下文），但它们可以在 Postgres95 中由用户定义的 SQL 函数模拟。
  聚集函数被重新实现。同时还增加了对 ``GROUP BY`` 查询子句的支持。
* 新增加了一个利用 GNU 的 Readline 进行交互 SQL 查询的程序（psql）。这个程序很大程度上取代了老的 monitor 程序。
* 增加了新的前端库（``libpgtcl``）， 用以支持基于 Tcl 的客户端。一个样本 shell（``pgtclsh``），
  提供了新的 Tcl 命令用于 Tcl 程序和 Postgres95 服务器之间的交互。
* 彻底重写了大对象的接口。保留了将大对象倒转（Inversion）作为存储大对象的唯一机制（去掉了倒转（Inversion）文件系统）。
* 去掉了实例级的规则系统。但规则仍然以重写规则的形式存在。
* 在发布的源码中增加了一个介绍 SQL 和 Postgres95 特性的简短教程。
* 用 GNU 的 make（取代了BSD 的 make）来编译。Postgres95 可以使用不打补丁的 GCC 编译（修正了双精度数据对齐问题）。

2.3. PostgreSQL
=====================================

到了 1996 年， 很明显 “Postgres95” 这个名字已经跟不上时代了。
于是我们选择了一个新名字 PostgreSQL 来反映与最初的 POSTGRES 和最新的具有 SQL 能力的版本之间的关系。
同时版本号也从 6.0 开始， 将版本号放回到最初由伯克利 POSTGRES 项目开始的序列中。

很多人会因为传统或者更容易发音而继续用 “Postgres” 来指代 PostgreSQL（现在很少用全大写字母）。
这种用法也被广泛接受为一种昵称或别名。

Postgres95 的开发重点放在标识和理解后端代码的现有问题上。
PostgreSQL 的开发重点则转到了一些有争议的特性和功能上面，当然各个方面的工作同时都在进行。

自那以来，PostgreSQL 发生的变化可以在 `Appendix E <https://www.postgresql.org/docs/11/release.html>`_ 中找到。

.. _[ston86]: https://www.postgresql.org/docs/11/biblio.html#STON86
.. _[rowe87]: https://www.postgresql.org/docs/11/biblio.html#ROWE87
.. _[ston87a]: https://www.postgresql.org/docs/11/biblio.html#STON87A
.. _[ston87b]: https://www.postgresql.org/docs/11/biblio.html#STON87B
.. _[ston90a]: https://www.postgresql.org/docs/11/biblio.html#STON90A
.. _[ston89]: https://www.postgresql.org/docs/11/biblio.html#STON89
.. _[ston90b]: https://www.postgresql.org/docs/11/biblio.html#STON90B
