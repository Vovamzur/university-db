create user deanery_worker with password 'deanery_worker';
create user student with password 'student';
create user campus_worker with password 'campus_worker';

create tablespace deanry_worker_tb owner deanery_worker location 'D:\bd\db_data';
create tablespace student_tb owner student location 'D:\bd\db_data_student';
create tablespace campus_worker_tb owner campus_worker location 'D:\bd\db_data_campus_worker';

create role deanery_worker_role login;
create role student_role login;
create role campus_worker_role login;

grant all on academic, auditorium, building, cathedra, cathedraemployee, class, controltype, department, departmenttype, discipline, exam, hostel, hostelresident, inventory, lesson, scientificproposal, specialty, student, subjectteaching to deanery_worker_role;

grant select on academic, auditorium, building, cathedra, cathedraemployee, class, controltype, department, departmenttype, discipline, doinventory, lesson, privelege, room, roomtype, scientificproposal, specialty, student, subjectteaching to student_role;
grant insert on cheque, doinventory to student_role;
grant delete on cheque to student_role;

grant all on doinventory, hostel, hostelresident, inventory, privelege, room, roomtype to campus_worker_role;
grant select on cheque, student to campus_worker_role;

grant deanery_worker_role to deanery_worker;
grant student_role to student;
grant campus_worker_role to campus_worker;

select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='deanery_worker_role';
select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='student_role';
select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='campus_worker_role';

create user deanery_worker1 with password 'deanery_worker1';
create user student1 with password 'student1';
create user campus_worker1 with password 'campus_worker1';

create table deanery_worker_academic1 as table academic;
grant all on deanery_worker_academic1 to deanery_worker1;
create table class_student1 as table class;
grant all on class_student1 to student1;
create table audotorium_campus_worker1 as table auditorium;
grant all on audotorium_campus_worker1 to campus_worker1;

grant all on deanery_worker_academic1 to deanery_worker;
grant all on class_student1 to student;
grant all on audotorium_campus_worker1 to campus_worker;

select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='deanery_worker_role1';
select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='student_role1';
select table_name, privilege_type, is_grantable from information_schema.role_table_grants where grantee='campus_worker_role1';

sudo -u deanery_worker1 psql
insert into deanery_worker_academic1(firstname, middlename, lastname, recruitment_date) values('Alex', 'Lee', 'Brown', NOW() :: DATE);
insert into deanery_worker_academic(firstname, middlename, lastname, recruitment_date) values('Alex', 'Lee', 'Brown', NOW() :: DATE);
-- error

sudo -u class_student1 psql
insert into class_student1(title, scientificproposal_id, curator_id) values('ІТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра технічної кібернетики') and specialty_id=(select id from specialty where area=12 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')));
insert into class(title, scientificproposal_id, curator_id) values('ІТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра технічної кібернетики') and specialty_id=(select id from specialty where area=12 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')));
-- error

sudo -u campus_worker1 psql
insert into audotorium_campus_worker1(capacity, building_id, computers_availibility, number) values(35, (select id from building where number=1), 't', 201);
insert into auditorium(capacity, building_id, computers_availibility, number) values(35, (select id from building where number=1), 't', 201);
-- error

sudo -u deanery_worker psql
insert into deanery_worker_academic1(firstname, middlename, lastname, recruitment_date) values('Alex', 'Lee', 'Brown', NOW() :: DATE);
insert into deanery_worker_academic(firstname, middlename, lastname, recruitment_date) values('Alex', 'Lee', 'Brown', NOW() :: DATE);
select * from deanery_worker_academic1;

sudo -u class_student psql
insert into class_student1(title, scientificproposal_id, curator_id) values('ІТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра технічної кібернетики') and specialty_id=(select id from specialty where area=12 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')));
insert into class(title, scientificproposal_id, curator_id) values('ІТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра технічної кібернетики') and specialty_id=(select id from specialty where area=12 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')));
select * from  class_student1;

sudo -u campus_worker psql
insert into audotorium_campus_worker1(capacity, building_id, computers_availibility, number) values(35, (select id from building where number=1), 't', 201);
select * from auditorium_campus_worker1;

commit;
commit;
commit;

sudo -u deanery_worker psql;
select * from deanery_worker_academic1;
create synonym dwa1 for deanery_worker.deanery_worker_academic1;
create view academics_fullnames1 as select dwa1.firstname, dwa1.middlename, dwa1.lastname from dwa1;
select * from academics_fullnames1;

sudo -u class_student psql;
select * from class_student1;
create synonym cs1 for student1.class_student1;
create view students_fullnames1 as select cs1.firstname, cs1.middlename, cs1.lastname from dwa;
select * from students_fullnames1;

sudo -u campus_worker  psql;
select * from auditorium_campus_workwer1;
create synonym cw1 for campus_worker1.auditorium_campus_workwer1;
create view inventory_name_count as select cw1.name, cw1.count from cw1;
select * from inventory_name_count ;

drop dwa1;
select * from academics_fullnames1;

drop cs1;
select * from students_fullnames1;

drop cw1;
select * from inventory_name_count;

revoke select on deanery_worker_academic1 from deanery_worker;
select * from academics_fullnames1;

revoke select on class_student1 from class_student;
select * from students_fullnames1;

revoke select on auditorium_campus_workwer1 campus_worker;
select * from inventory_name_count;

