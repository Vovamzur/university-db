alter table cathedraemployee rename to test_table;
alter table test_table rename to cathedraemployee;

alter table exam rename to exam_test;
alter table exam_test rename to exam;

alter table inventory rename to inventory_test;
alter table inventory_test rename to inventory;

alter table cathedra alter column title type varchar(60);
alter table cathedra add column  field integer not null;
alter table cathedra drop column field;

alter table exam alter column mark type varchar(20);
alter table exam alter column mark type INTEGER;
alter table exam add column field integer not null;
alter table exam drop column field;

alter table inventory alter column name type varchar(80);
alter table inventory add column field integer;
alter table inventory drop column field;



create index academic_i on academic(firstname, middlename, lastname);
create index specialty_i on specialty(area, code);
create index cathedra_i on cathedra(title, department_id);

create index student_i on student(firstname, middlename, lastname);
create index discipline_i on discipline(title, description);
create index class_i on class(title, scientificpropopsal_id);

create index cheque_i on cheque(payment_date, sum);
create index privelege_i on privelege (name, discount);
create index hostelresident_i on hostelresident(student_id, room_id);


create view academics_fullnames as select academic.firstname, academic.middlename, academic.lastname from academic;
create view students_fullnames as select student.firstname, student.middlename, student.lastname from student;
create view inventory_name_count as select inventory.name, inventory.count from inventory;