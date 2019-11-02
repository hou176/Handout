
> 提示：
* [Elasticsearch](https://www.elastic.co/) 的底层是开源库 [Lucene](https://lucene.apache.org/)。但是没法直接使用 Lucene，必须自己写代码去调用它的接口。

> 思考：
* 我们如何对接 Elasticsearch服务端？

> 解决方案：
* **Haystack**

##  Haystack介绍

#### Haystack介绍

* Haystack 是在Django中对接搜索引擎的框架，搭建了用户和搜索引擎之间的沟通桥梁。
    * 我们在Django中可以通过使用 Haystack 来调用 Elasticsearch 搜索引擎。
* Haystack 可以在不修改代码的情况下使用不同的搜索后端（比如 `Elasticsearch`、`Whoosh`、`Solr`等等）。
