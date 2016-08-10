slow changing dimension: 


A column level property for dimensional table, regarding to how to deal with a column when it's value changes. 
It is all about whether you want to perserve history, and if yes, how do you want it be preserved

type 0: no change in column should happen
type 1: overwrite directly
type 2: add new records, add effect date, expire date to preserve history
type 3: add new attribute "previous version column", like prevous addess vs current address
type 4: add seperate historical table, similar to type 2

