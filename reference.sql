--Quick reference for SQL syntax.
==========

SELECT *
FROM mytable;

SELECT column, another_column, …
FROM mytable;

SELECT mytable.column, mytable.another_column, …
FROM mytable;

SELECT column AS better_column_name, …
FROM a_long_table_name AS shortname

==========

SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;

--operators:
=, !=, < <=, >, >=
BETWEEN ... AND ...
IN
(...)
IS NULL
NOT

= is case sensitive
LIKE is not case sensitive
% is any sequence
_ is any single character

==========

SELECT DISTINCT column, another_column, …
FROM mytable
WHERE condition(s);

SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC
/DESC
LIMIT num_limit OFFSET num_offset;

==========

SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table 
    ON mytable.id = another_table.matching_id

==========

--common aggregate functions:
COUNT(*)
COUNT(column)
MIN(column)
MAX(column)
AVG(column)
SUM(column)

SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;

GROUP BY groups rows that have the same value in the column specified

==========

SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
FROM mytable
WHERE condition
GROUP BY column
HAVING group_condition;

HAVING is used with GROUP BY to filter grouped rows
HAVING constraints are written like WHERE constraints

==========

--Query order execution:
1. FROM and JOIN
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT and OFFSET

==========
==========

INSERT INTO mytable (column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …),
      (value_or_expr_2, another_value_or_expr_2, …),
      …;

UPDATE mytable
SET column = value_or_expr, 
    other_column = another_value_or_expr, 
    …
WHERE condition;

DELETE FROM mytable
WHERE condition;

CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
);

--datatypes:
INTEGER, BOOLEAN
FLOAT, DOUBLE, REAL 
CHARACTER(num_chars)
VARCHAR(num_chars)
TEXT
DATE, DATETIME
BLOB - binary

table constraints:
PRIMARY KEY
AUTOINCREMENT
UNIQUE
NOT NULL
CHECK (expression)
FOREIGN KEY

ALTER TABLE mytable
ADD column DataType OptionalTableConstraint 
    DEFAULT default_value;

ALTER TABLE mytable
DROP column_to_be_deleted;

ALTER TABLE mytable
RENAME TO new_table_name;

DROP TABLE IF EXISTS mytable;
