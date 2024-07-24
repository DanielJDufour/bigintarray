CREATE OR REPLACE FUNCTION bigintarray_length(a bigint[]) RETURNS integer
  LANGUAGE SQL
  IMMUTABLE
  RETURN array_length(a, 1);

CREATE OPERATOR # (
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_length
);

CREATE OR REPLACE FUNCTION bigintarray_intersect(a bigint[], b bigint[]) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN ARRAY(SELECT UNNEST($1) INTERSECT SELECT UNNEST($2));

CREATE OPERATOR & (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_intersect
);

CREATE OR REPLACE FUNCTION bigintarray_union(a bigint[], b bigint[]) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN ARRAY(SELECT UNNEST($1) UNION SELECT UNNEST($2));


CREATE OR REPLACE FUNCTION bigintarray_union_one(a bigint[], b bigint) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN bigintarray_union(a, Array[b]::bigint[]);

CREATE OPERATOR | (
  LEFTARG = bigint[],
  RIGHTARG = bigint,
  PROCEDURE = bigintarray_union_one
);

CREATE OPERATOR | (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_union
);

CREATE OR REPLACE FUNCTION bigintarray_except(a bigint[], b bigint[]) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN ARRAY(SELECT UNNEST($1) EXCEPT SELECT UNNEST($2));

CREATE OPERATOR - (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_except
);

CREATE OR REPLACE FUNCTION bigintarray_except_one(a bigint[], b bigint) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN bigintarray_except(a, Array[b]);

CREATE OPERATOR - (
  LEFTARG = bigint[],
  RIGHTARG = bigint,
  PROCEDURE = bigintarray_except_one
);

CREATE OR REPLACE FUNCTION bigintarray_concat_one(a bigint[], b bigint) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN array_cat(a, Array[b]);

CREATE OPERATOR + (
  LEFTARG = bigint[],
  RIGHTARG = bigint,
  PROCEDURE = bigintarray_concat_one
);

CREATE OR REPLACE FUNCTION bigintarray_concat(a bigint[], b bigint[]) RETURNS bigint[]
  LANGUAGE SQL
  IMMUTABLE
  RETURN array_cat(a, b);

CREATE OPERATOR + (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_concat
);
