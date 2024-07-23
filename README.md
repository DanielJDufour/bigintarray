# bigintarray
Like [intarray](https://www.postgresql.org/docs/current/intarray.html) module for PostgreSQL, but for Big Integers

## references
descriptions are copied from [intarray](https://www.postgresql.org/docs/current/intarray.html).
| Operator | Description | Status |
| -- | -- | --- |
| bigint[] && bigint[] → boolean | Do arrays overlap (have at least one element in common)? | X |
| bigint[] @> bigint[] → boolean | Does left array contain right array? | X |
| bigint[] <@ bigint[] → boolean | Is left array contained in right array? | X |
| # bigint[] → integer | Returns the number of elements in the array | :heavy_check_mark: |
| bigint[] # bigint → integer | Returns index of the first array element matching the right argument, or 0 if no match. (Same as idx function.) | X |
| bigint[] + bigint → bigint[] | Adds element to end of array. | X |
| bigint[] + bigint[] → bigint[] | Concatenates the arrays. | X |
| bigint[] - bigint[] → bigint[] | Removes elements of the right array from the left array. | X |
| bigint[] \| bigint → bigint[] | Computes the union of the arguments. | X |
| bigint[] \| bigint[] → bigint[] | Computes the union of the arguments. | X |
| bigint[] & bigint[] → bigint[] | Computes the intersection of the arguments. | X |
| bigint[] @@ query_bigint → boolean | Does array satisfy query? (see below) | X |
| query_bigint ~~ bigint[] → boolean | Does array satisfy query? (commutator of @@) | X |
