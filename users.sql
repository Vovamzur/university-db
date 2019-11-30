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
