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

CREATE OPERATOR | (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_union
);

CREATE OR REPLACE FUNCTION bigintarray_intersect_size(a bigint[], b bigint[]) RETURNS integer
  LANGUAGE SQL
  IMMUTABLE
  RETURN # (a & b);

CREATE OR REPLACE FUNCTION bigintarray_intersect_boolean(a bigint[], b bigint[]) RETURNS boolean
  LANGUAGE SQL
  IMMUTABLE
  RETURN bigintarray_intersect_size(a, b) >= 1;

CREATE OPERATOR && (
  LEFTARG = bigint[],
  RIGHTARG = bigint[],
  PROCEDURE = bigintarray_intersect_boolean
);


