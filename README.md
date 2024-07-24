# bigintarray
Like [intarray](https://www.postgresql.org/docs/current/intarray.html) module for PostgreSQL, but for Big Integers

## typical installation
```sh
git clone https://github.com/DanielJDufour/bigintarray

cd bigintarray

make install

make installcheck

psql -c "CREATE EXTENSION bigintarray";
```

## alternative installation
Sometimes you aren't allowed to add custom extensions, like in a cloud environment.  In that case, you can install by either copying the contents of [bigintarray--0.0.1.sql](https://raw.githubusercontent.com/DanielJDufour/bigintarray/main/bigintarray--0.0.1.sql) into your database initialization code or running the following commands
```sh
# download code for the extension
wget https://raw.githubusercontent.com/DanielJDufour/bigintarray/main/bigintarray--0.0.1.sql

# create functions and operators by directly executing SQL statements
psql -h 0.0.0.0 -p 5432 --username postgres database < ./bigintarray--0.0.1.sql;
```

## references
descriptions are based on [intarray](https://www.postgresql.org/docs/current/intarray.html).
| Operator | Description | Status |
| -- | -- | --- |
| bigint[] && bigint[] → boolean | Do arrays overlap (have at least one element in common)? | ✓ (Built-In) |
| bigint[] @> bigint[] → boolean | Does left array contain right array? | ✓ (Built-In) |
| bigint[] <@ bigint[] → boolean | Is left array contained in right array? | ✓ (Built-In) |
| # bigint[] → integer | Returns the number of elements in the array | ✓ |
| bigint[] # bigint → integer | Returns index of the first array element matching the right argument, or 0 if no match. (Same as idx function.) | X |
| bigint[] + bigint → bigint[] | Adds element to end of array. | ✓ |
| bigint[] + bigint[] → bigint[] | Concatenates the arrays. | ✓ |
| bigint[] - bigint[] → bigint[] | Removes elements of the right array from the left array. | ✓ |
| bigint[] \| bigint → bigint[] | Computes the union of the arguments. | ✓ |
| bigint[] \| bigint[] → bigint[] | Computes the union of the arguments. | ✓ |
| bigint[] & bigint[] → bigint[] | Computes the intersection of the arguments. | ✓ |
| bigint[] @@ query_bigint → boolean | Does array satisfy query? (see below) | X |
| query_bigint ~~ bigint[] → boolean | Does array satisfy query? (commutator of @@) | X |
