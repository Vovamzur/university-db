CREATE TABLE academic
(
  id serial PRIMARY KEY,
  firstname VARCHAR(20) NOT NULL,
  middlename VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL,
  recruitment_date DATE
);

CREATE TABLE departmenttype
(
  id serial PRIMARY KEY,
  type VARCHAR(15) NOT NULL
);

CREATE TABLE department
(
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  creation_date DATE,
  head_id INTEGER REFERENCES academic(id) NOT NULL,
  departmenttype_id INTEGER REFERENCES departmenttype(id) NOT NULL
);

CREATE TABLE building
(
  id serial PRIMARY KEY,
  adress VARCHAR(40) NOT NULL,
  auditoriums_amount INTEGER,
  number INTEGER NOT NULL,
  floors_amount INTEGER
);

CREATE TABLE auditorium
(
  id serial PRIMARY KEY,
  capacity INTEGER NOT NULL,
  number INTEGER NOT NULL,
  building_id INTEGER REFERENCES building(id) NOT NULL,
  computers_availibility CHAR(1)
);

CREATE TABLE cathedra
(
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  department_id INTEGER REFERENCES department(id) NOT NULL,
  dean_id INTEGER REFERENCES academic(id) NOT NULL
);

CREATE TABLE cathedraemployee
(
  id serial PRIMARY KEY,
  academic_id INTEGER REFERENCES academic(id) NOT NULL,
  cathedra_id INTEGER REFERENCES cathedra(id) NOT NULL
);

CREATE TABLE discipline
(
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE specialty
(
  id serial PRIMARY KEY,
  area INTEGER NOT NULL,
  code INTEGER NOT NULL,
  title VARCHAR(90) NOT NULL
);

CREATE TABLE scientificproposal
(
  id serial PRIMARY KEY,
  cathedra_id INTEGER REFERENCES cathedra(id) NOT NULL,
  specialty_id INTEGER REFERENCES specialty(id) NOT NULL
);

CREATE TABLE class
(
  id serial PRIMARY KEY,
  title VARCHAR(5) NOT NULL,
  scientificproposal_id INTEGER REFERENCES scientificproposal(id) NOT NULL,
  curator_id INTEGER REFERENCES cathedraemployee(id) NOT NULL
);

CREATE TABLE controltype
(
  id serial PRIMARY KEY,
  type VARCHAR(80) NOT NULL,
  description TEXT
);

CREATE TABLE subjectteaching
(
  id serial PRIMARY KEY,
  basic_discipline CHAR(1),
  discipline_id INTEGER REFERENCES discipline(id) NOT NULL,
  cathedraemployee_id INTEGER REFERENCES cathedraemployee(id) NOT NULL,
  class_id INTEGER REFERENCES class(id) NOT NULL,
  controltype_id INTEGER REFERENCES controltype(id) NOT NULL
);

CREATE TABLE student
(
  id serial PRIMARY KEY,
  firstname VARCHAR(20) NOT NULL,
  middlename VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL,
  hostel_need CHAR(1),
  class_id INTEGER REFERENCES class(id) NOT NULL
);

CREATE TABLE exam
(
  id serial PRIMARY KEY,
  time DATE NOT NULL,
  mark INTEGER,
  student_id INTEGER REFERENCES student(id) NOT NULL,
  subjectteaching_id INTEGER REFERENCES subjectteaching(id) NOT NULL,
  auditorium_id INTEGER REFERENCES auditorium(id)
);

CREATE TABLE lesson
(
  id serial PRIMARY KEY,
  subjectteaching_id INTEGER REFERENCES subjectteaching(id) NOT NULL,
  time DATE,
  auditorium_id INTEGER REFERENCES auditorium(id)
);

CREATE TABLE privelege
(
  id serial PRIMARY KEY,
  name VARCHAR(70) NOT NULL,
  discount INTEGER NOT NULL
);

CREATE TABLE hostel
(
  id serial PRIMARY KEY,
  number INTEGER NOT NULL,
  head VARCHAR(50) NOT NULL
);

CREATE TABLE roomtype
(
  id serial PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE room
(
  id serial PRIMARY KEY,
  number INTEGER NOT NULL,
  capacity INTEGER NOT NULL,
  -- price INTEGER NOT NULL,
  hostel_id INTEGER REFERENCES hostel(id) NOT NULL,
  roomtype_id INTEGER REFERENCES roomtype(id) NOT NULL
);

CREATE TABLE hostelresident
(
  id serial PRIMARY KEY,
  abilities TEXT,
  student_id INTEGER REFERENCES student(id) NOT NULL,
  room_id INTEGER REFERENCES room(id) NOT NULL,
  previlege_id INTEGER REFERENCES privelege(id)
);

CREATE TABLE cheque
(
  id serial PRIMARY KEY,
  payment_date DATE NOT NULL,
  sum INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  hostelresident_id INTEGER REFERENCES hostelresident(id) NOT NULL
);

CREATE TABLE inventory
(
  id serial PRIMARY KEY,
  name VARCHAR(70) NOT NULL,
  count INTEGER NOT NULL
);

CREATE TABLE doinventory
(
  id serial PRIMARY KEY,
  inventory_date DATE,
  inventory_id INTEGER REFERENCES inventory(id) NOT NULL,
  hostelresident_id INTEGER REFERENCES hostelresident(id) NOT NULL
);
