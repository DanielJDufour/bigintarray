CREATE EXTENSION bigintarray;

SELECT # ARRAY[123456789, 123456789, 123456789]::bigint[] AS "Length";

SELECT ARRAY[1,4,3]::bigint[] @> ARRAY[3,1,3]::bigint[] AS "Left Contains Right";

SELECT ARRAY[2,2,7]::bigint[] <@ ARRAY[1,7,4,2,6]::bigint[] AS "Right Contains Left";

SELECT ARRAY[123, 456]::bigint[] & ARRAY[456, 789]::bigint[] AS "Intersection";

SELECT ARRAY[123, 456]::bigint[] && ARRAY[456, 789]::bigint[] AS "Overlaps";

SELECT ARRAY[123, 456]::bigint[] | ARRAY[456, 789]::bigint[] AS "Union";
SELECT ARRAY[123, 456]::bigint[] | 456::bigint AS "Union with bigint[] | bigint";

SELECT ARRAY[1,2,3]::bigint[] || ARRAY[1,2,3,4]::bigint[] AS "Concat with ||";
SELECT ARRAY[1,2,3]::bigint[] + ARRAY[1,2,3,4]::bigint[] AS "Concat with +";
SELECT ARRAY[1,2,3]::bigint[] + 1::bigint AS "Concat bigint[] + bigint";

SELECT ARRAY[1, 2, 3]::bigint[] - ARRAY[1, 2]::bigint[] AS "Subtraction";
SELECT ARRAY[1, 2, 3]::bigint[] - 1::bigint AS "Subtraction";