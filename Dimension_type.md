degenerate dimension
- often the natural key of the parent of the line items in fact
- for example, a retail case, receipt number, incluing mulpile items in one receipt(one sample)
- in this case, there is no need to form a seperate dimestion

junk dimension
-The nature of these attributes is usually text or various flags, 
- e.g. non-generic comments or just simple yes/no or true/false indicators. 
- These kinds of attributes are typically remaining when all the obvious dimensions in the business process have been identified(That why it was called junk)
- and thus the designer is faced with the challenge of where to put these attributes that do not belong in the other dimensions.
- To solve this a junk dimension is created to store all possible combination of these flags.

conformed Dimension
- a dimension table that can be used with different fact tables across the organization
- for example, a customer dimension can be used with the shiping fact table, sales fact table as well as the server fact table.

role playing dimension
- a example would be date dimension
- while joinning to the shiping date, sale date, delivery date, it has different meanings.




