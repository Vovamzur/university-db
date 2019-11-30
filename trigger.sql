create table academic_audits
(
  id SERIAL PRIMARY KEY,
  academic_id INT NOT NULL,
  lastname VARCHAR(40) NOT NULL,
  changed_on TIMESTAMP(6) NOT NULL
)

CREATE OR REPLACE FUNCTION log_academic_lastname_changes
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.lastname <> OLD.lastname THEN
  INSERT INTO academic_audits
    (academic_id,lastname,changed_on)
  VALUES(OLD.id, OLD.lastname, now());
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER lastname_changes
  BEFORE
UPDATE
  ON academic
  FOR EACH ROW
EXECUTE PROCEDURE log_academic_lastname_changes
();

CREATE TRIGGER lastname_delete
  BEFORE
DELETE
  ON academic
EXECUTE PROCEDURE log_academic_lastname_changes
();

CREATE TRIGGER lastname_insert
  BEFORE
INSERT
  ON
academic
EXECUTE PROCEDURE log_academic_lastname_changes
();






create table exam_audits
(
  id SERIAL PRIMARY KEY,
  exam_id INT NOT NULL,
  mark INTEGER NOT NULL,
  changed_on TIMESTAMP(6) NOT NULL
)

CREATE OR REPLACE FUNCTION log_exam_mark_changes
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.mark <> OLD.mark THEN
  INSERT INTO exam_audits
    (exam_id,mark,changed_on)
  VALUES(OLD.id, OLD.mark, now());
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER mark_changes
  BEFORE
UPDATE
  ON exam
  FOR EACH ROW
EXECUTE PROCEDURE log_exam_mark_changes
();

CREATE TRIGGER mark_delete
  BEFORE
DELETE
  ON exam
EXECUTE PROCEDURE log_exam_mark_changes
();

CREATE TRIGGER mark_insert
  BEFORE
INSERT
  ON
exam
EXECUTE PROCEDURE log_exam_mark_changes
();






create table cheque_audits
(
  id SERIAL PRIMARY KEY,
  cheque_id INT NOT NULL,
  sum INTEGER NOT NULL,
  changed_on TIMESTAMP(6) NOT NULL
)

CREATE OR REPLACE FUNCTION log_cheque_sum_changes
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.sum <> OLD.sum THEN
  INSERT INTO cheque_audits
    (cheque_id, sum, changed_on)
  VALUES(OLD.id, OLD.sum, now());
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER sum_changes
  BEFORE
UPDATE
  ON cheque
  FOR EACH ROW
EXECUTE PROCEDURE log_cheque_sum_changes
();

CREATE TRIGGER sum_delete
  BEFORE
DELETE
  ON cheque
EXECUTE PROCEDURE log_cheque_sum_changes
();

CREATE TRIGGER sum_insert
  BEFORE
INSERT
  ON
cheque
EXECUTE PROCEDURE log_cheque_sum_changes
();


CREATE OR REPLACE FUNCTION check_insert_inventory
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.count < 0 THEN
  RAISE EXCEPTION 'Negative count--> %', NEW.count
      USING HINT = 'Please check your count';
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER check_insert_inventory_tr
  BEFORE
INSERT
  ON
inventory
FOR
EACH
ROW
EXECUTE PROCEDURE check_insert_inventory
();

CREATE TRIGGER check_update_inventory_tr
  BEFORE
UPDATE
  ON inventory
  FOR EACH ROW
EXECUTE PROCEDURE check_insert_inventory
();


CREATE OR REPLACE FUNCTION check_insert_exam
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.mark < 60 or NEW.mark > 100 THEN
  RAISE EXCEPTION 'Mark must be less or equal than 100 and more or equl than 60--> %', NEW.mark
      USING HINT = 'Please check your mark';
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER check_insert_exam_tr
  BEFORE
INSERT
  ON
exam
FOR
EACH
ROW
EXECUTE PROCEDURE check_insert_exam
();

CREATE TRIGGER check_update_exam_tr
  BEFORE
UPDATE
  ON exam
  FOR EACH ROW
EXECUTE PROCEDURE check_insert_exam
();


CREATE OR REPLACE FUNCTION check_insert_room
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.capacity > 4 THEN
  RAISE EXCEPTION 'The capacity of room must be less than 4--> %', NEW.capacity
      USING HINT = 'Please check your capacity';
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER check_insert_room_tr
  BEFORE
INSERT
  ON
room
FOR
EACH
ROW
EXECUTE PROCEDURE check_insert_room
();

CREATE TRIGGER check_update_room_tr
  BEFORE
UPDATE
  ON room
  FOR EACH ROW
EXECUTE PROCEDURE check_insert_room
();


CREATE OR REPLACE FUNCTION check_insert_building
()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.number < 0 or NEW.auditoriums_amount < 0 or NEW.floors_amount < 0 THEN
  RAISE EXCEPTION 'variables are incorrect --> %', NEW.number
      USING HINT = 'Please check your isert or update variables';
END
IF;
 
   RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE

CREATE TRIGGER check_insert_building_tr
  BEFORE
INSERT
  ON
building
FOR
EACH
ROW
EXECUTE PROCEDURE check_insert_building
();

CREATE TRIGGER check_update_bulding_tr
  BEFORE
UPDATE
  ON building
  FOR EACH ROW
EXECUTE PROCEDURE check_insert_building
();