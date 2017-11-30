CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size FROM dogs AS d, sizes AS s
  WHERE d.height > s.min AND d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY height DESC;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT f.name || " and " || s.name || " are " || s.size ||" siblings"
  FROM size_of_dogs AS f, size_of_dogs AS s, parents AS t, parents AS fo
  WHERE f.size = s.size AND f.name <> s.name AND t.child = f.name AND fo.child = s.name
  AND t.parent = fo.parent AND f.name < s.name ORDER BY f.name;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
  WITH
  stack(last_dog, previous_dogs, i, total, last_height) as (
  SELECT name, name, 1, height, height FROM dogs UNION
  SELECT name, previous_dogs || ", " || name, i+1, total + height, height
    FROM stack, dogs
    WHERE height > last_height AND i < 4
  )
  SELECT previous_dogs, total FROM stack WHERE total >= 170 ORDER BY total;
