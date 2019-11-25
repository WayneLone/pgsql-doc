# PostgreSQL 10.1 Document

详细资料请参考 <http://www.postgres.cn/docs>，由于不喜欢 DocBook 的样式，才起了这个项目（项目使用 sphinx 构建）。

该项目为个人娱乐项目，数据上同步迟缓。

## 文档编译

1. 下载源码：

   ```bash
   git clone https://github.com/WayneLone/pgsql-doc.git
   ```

2. 安装 [Python](https://python.org/)， 编译构建文档：

   ```bash
   pip install -U sphinx
   make html
   ```
