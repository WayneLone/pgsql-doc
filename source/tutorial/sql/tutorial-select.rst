2.3. 查询一个表
=====================================

要从一个表中检索数据就是查询这个表。SQL 的 ``SELECT`` 语句就是做这个用途的。
该语句分为选择列表（列出要返回的列）、表列表（列出从中检索数据的表）以及可选的条件（指定任意的限制）。
比如，要检索表 ``weather`` 的所有行，键入：

.. code-block:: sql

   SELECT * FROM weather;

这里 ``*`` 是 “所有列” 的缩写。[2]_ 因此相同的结果应该这样获得：

.. code-block:: sql

   SELECT city, temp_lo, temp_hi, prcp, date FROM weather;

而输出应该是：

.. code-block::

        city     | temp_lo | temp_hi | prcp |    date
   --------------+---------+---------+------+------------
   San Francisco |      46 |      50 | 0.25 | 1994-11-27
   San Francisco |      43 |      57 |    0 | 1994-11-29
   Hayward       |      37 |      54 |      | 1994-11-29
   (3 rows)

你可以在选择列表中写任意表达式，而不仅仅是列的列表。比如，你可以：

.. code-block:: sql

   SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM weather;

这样应该得到：

.. code-block::

        city     | temp_avg |    date
   --------------+----------+------------
   San Francisco |       48 | 1994-11-27
   San Francisco |       50 | 1994-11-29
   Hayward       |       45 | 1994-11-29
   (3 rows)

请注意这里的 ``AS`` 子句是如何给输出列重新命名的（``AS`` 子句是可选的）。

一个查询可以使用 ``WHERE`` 子句“修饰”，它指定需要哪些行。WHERE子句包含一个布尔（真值）表达式，只有那些使布尔表达式为真的行才会被返回。
在条件中可以使用常用的布尔操作符（``AND``、``OR` `和 ``NOT``）。 比如，下面的查询检索旧金山的下雨天的天气：

.. code-block:: sql

   SELECT * FROM weather
       WHERE city = 'San Francisco' AND prcp > 0.0;

结果：

.. code-block::

        city      | temp_lo | temp_hi | prcp |    date
   ---------------+---------+---------+------+------------
    San Francisco |      46 |      50 | 0.25 | 1994-11-27
   (1 row)

你可以要求返回的查询结果是排好序的：

.. code-block:: sql

   SELECT * FROM weather
       ORDER BY city;

.. code-block::

        city      | temp_lo | temp_hi | prcp |    date
   ---------------+---------+---------+------+------------
    Hayward       |      37 |      54 |      | 1994-11-29
    San Francisco |      43 |      57 |    0 | 1994-11-29
    San Francisco |      46 |      50 | 0.25 | 1994-11-27

在这个例子里，排序的顺序并未完全被指定，因此你可能看到属于旧金山的行被随机地排序。但是如果你使用下面的语句，那么就总是会得到上面的结果：

.. code-block:: sql

   SELECT * FROM weather
       ORDER BY city, temp_lo;

你可以要求在查询的结果中消除重复的行：

.. code-block:: sql

   SELECT DISTINCT city
       FROM weather;

.. code-block::

     city
   ---------------
    Hayward
    San Francisco
   (2 rows)

再次声明，结果行的顺序可能变化。你可以组合使用DISTINCT和ORDER BY来保证获取一致的结果：[3]_

.. code-block:: sql

   SELECT DISTINCT city
        FROM weather
        ORDER BY city;

.. rubric:: Footnotes

.. [2] 虽然 ``SELECT *`` 对于即席查询很有用，但我们普遍认为在生产代码中这是很糟糕的风格，因为给表增加一个列就改变了结果。
.. [3] 在一些数据库系统里，包括老版本的 PostgreSQL，``DISTINCT`` 的实现自动对行进行排序，因此 ``ORDER BY`` 是多余的。
   但是这一点并不是 SQL 标准的要求，并且目前的 PostgreSQL 并不保证 ``DISTINCT`` 会导致行被排序。
