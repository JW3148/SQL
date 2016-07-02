Data Aggregation
- processes may not use the origianal transaction level granularity
- identity the deepest aggregation level that is used by the process and perform pre-aggregation
- this is very useful when your process is hitting this source multiple times

Indexing
- As time goes on, the query changes and become more complicated, check if the currently still works or if plan shows scan
- make sure large queries are coverged by indexes
- creating index: clustered index first, then followed by non-clustered index(if you create cluster index at last, all non-clustered index will rebuild

Descriptive data
- don't not bring in descriptive data(through lookup tables) during the process, push them to the very end
- this help to carry less data in and out of the intermiate process

Avoid function in where clause
- can not utilize index

Multiple update
- try to do multiple updata in one pass if possible

Control column size
- avoid using over-sized for fix size columns, such as big decimal, char

Isolate applications from sources
- pull source data into temp table(maybe with some transformation, maybe a permanent table) at the start of the process
- later process will hit the temp table instead of directly going to the sources
- this gives more flexibilty case you want to change the source, or the source has to be changed
- also more flexibilty when you want only a subset of data for testing purpose

Table Compression
