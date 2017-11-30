.read sp17data.sql
.read fa17data.sql

CREATE TABLE obedience AS
  SELECT seven, denero, hilfinger FROM students;

CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 18 ORDER BY smallest LIMIT 20;

CREATE TABLE greatstudents AS
  SELECT s.date, s.color, s.pet, f.number, s.number FROM sp17students AS s, students AS f
  WHERE f.date = s.date AND f.color = s.color AND f.pet = s.pet
  ORDER BY f.date;


CREATE TABLE sevens AS
  SELECT s.seven FROM students AS s, checkboxes AS c
  WHERE c.'7' = 'True' AND s.number = 7 AND c.time = s.time;

CREATE TABLE matchmaker AS
  SELECT f.pet, f.song, f.color, s.color FROM students AS f, students AS s
  WHERE f.pet = s.pet AND f.song = s.song AND f.time <> s.time;
