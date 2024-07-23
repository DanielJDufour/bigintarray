# bigintarray
Like [intarray](https://www.postgresql.org/docs/current/intarray.html) module for PostgreSQL, but for Big Integers

## references
descriptions are copied from [intarray](https://www.postgresql.org/docs/current/intarray.html).
| Operator | Description | Status |
| -- | -- | --- |
| integer[] && integer[] → boolean | Do arrays overlap (have at least one element in common)? | X |
| integer[] @> integer[] → boolean | Does left array contain right array? | X |
| integer[] <@ integer[] → boolean | Is left array contained in right array? | X |
| # bigint[] → integer | Returns the number of elements in the array | :heavy_check_mark: |
| integer[] # integer → integer | Returns index of the first array element matching the right argument, or 0 if no match. (Same as idx function.) | X |
| integer[] + integer → integer[] | Adds element to end of array. | X |
| integer[] + integer[] → integer[] | Concatenates the arrays. | X |
| integer[] - integer[] → integer[] | Removes elements of the right array from the left array. | X |
| integer[] \| integer → integer[] | Computes the union of the arguments. | X |
| integer[] \| integer[] → integer[] | Computes the union of the arguments. | X |
| integer[] & integer[] → integer[] | Computes the intersection of the arguments. | X |
| integer[] @@ query_int → boolean | Does array satisfy query? (see below) | X |
| query_int ~~ integer[] → boolean | Does array satisfy query? (commutator of @@) | X |
