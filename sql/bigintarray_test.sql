CREATE EXTENSION bigintarray;

SELECT # ARRAY[123456789, 123456789, 123456789]::bigint[] AS "Length";

SELECT ARRAY[123, 456]::bigint[] & ARRAY[456, 789]::bigint[] AS "Intersection";

SELECT ARRAY[123, 456]::bigint[] && ARRAY[456, 789]::bigint[] AS "Overlaps";

SELECT ARRAY[123, 456]::bigint[] | ARRAY[456, 789]::bigint[] AS "Union";
