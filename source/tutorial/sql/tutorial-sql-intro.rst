2.1 引言
=====================================

本章提供一个如何使用 SQL 执行简单操作的概述。本教程的目的只是给你一个介绍，并非完整的 SQL 教程。
有许多关于 SQL 的书籍，包括 `[melt93]`_ 和 `[date97]`_。你还要知道有些 PostgreSQL 语言特性是对标准的扩展。

在随后的例子里，我们假设你已经创建了名为 ``mydb`` 的数据库，就象在前面的章里面介绍的一样，并且已经能够启动 psql。

本手册的例子也可以在 PostgreSQL 源代码的目录 ``src/tutorial/`` 中找到
（二进制 PostgreSQL 发布中可能没有编译这些文件）。要使用这些文件，首先进入该目录然后运行 make：

.. code-block:: shell

   $ cd ..../src/tutorial
   $ make

这样就创建了那些脚本并编译了包含用户定义函数和类型的 C 文件。接下来，要开始本教程，按照下面说的做：

.. code-block:: shell

   $ cd ..../tutorial
   $ psql -s mydb

   ...

   mydb=> \i basics.sql

``\i`` 命令从指定的文件中读取命令。psql 的 ``-s`` 选项把你置于单步模式，它在向服务器发送每个语句之前暂停。
在本节使用的命令都在文件 ``basics.sql`` 中。

.. _[melt93]: https://www.postgresql.org/docs/11/biblio.html#MELT93
.. _[date97]: https://www.postgresql.org/docs/11/biblio.html#DATE97
