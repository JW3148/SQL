control flow level

a. precedence constraint, enable parallel

b. use executed sql task, rather than doing everything with SSIS items

data flow level

(extract data)

a. extract only date required, use SQL query in OLEDB connect manager to load data

b. use the fast load option

(transformations)

a. avoid merge, merged join, sort transformation as these require data to be sorted

b. set IsSorted property to be true if you know the data is sorted, before merge

c. if you are using lookup transformation, take full cache of the reference table

d. avoid use OLEDB command since is row by row procesing, consider set based logic

(Buffer and Threads)

a. Increase the Buffer size of data pipelines, by default 10MB, Maximum 100MB. You can also increase the DefaultBufferMaxRows(to 10000 at max)

b. Increase EngineThread which is the same as MaxConcurrentExecutables in the control level 
