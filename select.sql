-- Переглянути факультети та дату їх створення:
select title, creation_date from department;

-- Переглянути ініціали студентів:
select concat(lastname, ' ', substring(firstname, 1, 1), '.', substring(middlename, 1, 1), '.') as initials from student;

-- Порахувати середню оцінку в групі з певного предмету:
select avg(mark) from exam where subjectteaching_id=(select id from subjectteaching where discipline_id=(select id from discipline where title='Основи програмування') and class_id=(select id from class where title='СА-71'));

-- Переглянути оцінку за ім’ям студента з певної групи з певного предмету:
select mark from exam where student_id=(select id from student where firstname='Ірина' and lastname='Матвійчук') and subjectteaching_id=(select id from subjectteaching where discipline_id=(select id from discipline where title='Основи програмування') and class_id=(select id from class where title='СА-71'));

-- Переглянути всіх викладачів і факультет на якому вони є деканами:
select firstname, lastname, title from academic a left join department d on a.id=d.head_id;

-- Переглянути всі чеки в яких початкова дата початку періоду в діапазоні від '2019-08-01' і до '2019-10-01':
select * from cheque where start_date between '2019-08-01' and '2019-10-01';

-- Переглянути ініціали студента, період оплати та суму:
select concat(lastname, ' ', substring(firstname, 1, 1), '.', substring(middlename, 1, 1), '.') as initials, concat('from ', start_date, ' to ', end_date) as range, sum from cheque c inner join hostelresident h on c.hostelresident_id=h.id inner join student s on h.student_id=s.id;

-- Переглянути дисципліни в описі яких є слова “інфологічний” і “даталогічний” в різних відмінках:
select title, description from discipline where description like any (array['%даталогічн%', '%інфологічн%']);

-- Переглянути всіх викладачів з кафедрою та згрупованих за кафедрою та відсортованих на ініціалами:
select concat(lastname, ' ', substring(firstname, 1, 1), '.', substring(middlename, 1, 1), '.') as initials, title from cathedraemployee ce right join academic a on ce.academic_id=a.id left join cathedra c on ce.cathedra_id=c.id group by title, initials order by initials;

-- Знайти всіх викладачів прізвище яких починається на “Олекс”
select concat(lastname, ' ', substring(firstname, 1, 1), '.', substring(middlename, 1, 1), '.') as initials from academic where lastname like 'Олекс%';

-- Переглянути всі можливі назви дисциплін та їх опис.
select title, description from discipline;

-- Перегланути дисципліни, що починаються на літери від А до Г’
select d.title, d.description from discipline d where d.title similar to '[А-Г]%';

-- Вибрати номери аудиторій, де наявні комп'ютери.
select number from auditorium where computers_availibility='t';

-- Знайти середній бал студента з прізвищем
select round(avg(mark), 2) from exam where student_id=(select id from student where lastname='Сергієнко');

-- Переглянути, який викладач читає кожен предмет у відповідній групі
select class.title, d.title, concat(lastname, ' ', substring(ac.firstname, 1, 1), '.', substring(ac.middlename, 1, 1), '.') as initials 
from subjectteaching st 
inner join class on st.class_id = class.id
left join discipline d on st.discipline_id = d.id 
left join cathedraemployee ce on st.cathedraemployee_id = ce.id
inner join academic ac on ce.academic_id = ac.id;

-- Подивитися оцінки для конкретного студента
SELECT s.lastname, s.firstname, s.middlename, e.mark from exam e
INNER JOIN student s ON e.student_id=s.id
where s.lastname='Мазур';

-- Переглянути список студентів певної групи та відсортувати їх 
select  concat(lastname, ' ', substring(firstname, 1, 1), '.', substring(middlename, 1, 1), '.') as initials
from student
where class_id=(select id from class where title='ІТ-72')
order by lastname desc;

-- Переглянути список дисциплін на екзаменах між деякими датами.
select d.title, time
from exam
left join subjectteaching st on exam.subjectteaching_id = st.id
inner join discipline d on st.discipline_id = d.id
where time between '2019-10-30' and '2019-10-31';

-- Переглянути всі типи контролю та відповідні дисципліни для певної групи
select cl.title, d.title, ct.type
from subjectteaching st
left join controltype ct on st.controltype_id = ct.id
left join discipline d on st.discipline_id = ct.id
left join class cl on st.class_id = cl.id 
where class_id in ( select id from class where title='ІТ-72');

-- Переглянути корпуси в яких є аудиторії з місткістю більше 100:
select b.number, b.adress, a.capacity from building b inner join auditorium a on b.id=a.building_id where a.capacity > 100;

-- Переглянути всі можливі пільги та відповідні знижки
select name, discount from privelege;

-- Знайти інвентар, якого найбільше у гуртожитку
select name, count
from inventory
where count = (select max(count) from inventory);

-- Переглянути студентів, що проживають у 8 гуртожитку
select concat(s.lastname, ' ', substring(s.firstname, 1, 1), '.', substring(s.middlename, 1, 1), '.'), h.number from hostelresident hr
left join student s on hr.student_id = s.id
left join room r on hr.room_id = r.id
left join hostel h on r.hostel_id = h.id
where h.number = 8;

-- Переглянути студентів певної кімнати певного гуртожитку
select s.lastname
from hostelresident hr
left join student s on hr.student_id = s.id
where room_id in (select id from room where number = 1 and hostel_id in (
	select id from hostel where number = 1
));

-- Переглянути пільги, що надають знижку від 50% до 80%.
select name, discount from privelege where discount between 50 and 80;

-- Знайти кількість чеків, що перевалили суму в 50
select count(*) from cheque where sum > 50;

-- Знайти тип кімнати та її ціну за її номером та номер гуртожитку
select room.number, rt.name, rt.price
from room
left join roomtype rt on room.roomtype_id = rt.id
where room.number = 1 and room.hostel_id in (select id from hostel where number = 8);

-- Переглянути гуртожитки, прізвища завідуючих яких починаються на літери від А до Д у алфавітному порядку за цими прізвищами.
select number, head
from hostel
where head similar to '[А-Д]%'
order by head;

-- Переглянути студентів та їх відповідні оплати, що здійснювались від певного періоду
select st.lastname, ch.payment_date, ch.sum
from cheque ch
left join hostelresident hr on ch.hostelresident_id = hr.id
left join student st on hr.student_id = st.id
where ch.payment_date > '2019-10-30';

-- Переглянути інвентар, що був виданий на студентів, прізвища яких починаються на М.
select i.name, st.firstname, st.lastname
from doinventory di
inner join inventory i on di.inventory_id = i.id
left join hostelresident hr on di.hostelresident_id = hr.id
left join student st on hr.student_id = st.id
where st.id in (select id from student where lastname like 'М%');
