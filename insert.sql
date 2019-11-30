alter table academic add constraint unique_fullname unique (firstname, middlename, lastname);

insert into academic(firstname, middlename, lastname, recruitment_date) values('Alex', 'Lee', 'Brown', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Ярослав', 'Ігорович', 'Корнага', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Олег', 'Іванович', 'Лісовиченко', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Михайло', 'Володимирович', 'Кушлаба', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Ірина', 'Костянтинівна', 'Покулита', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Аліна', 'Дмитрівна', 'Курочкіна', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Наталя', 'Станіславівна', 'Корнієнко', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Генадій', 'Вікторович', 'Рябцев', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Артем', 'Петрович', 'Заворикін', NOW() :: DATE);
insert into academic(firstname, middlename, lastname, recruitment_date) values('Владислав', 'Олегович', 'Мамедов', NOW() :: DATE);





alter table departmenttype add constraint unique_department_type unique (type);

insert into departmenttype(type) values('факультет');
insert into departmenttype(type) values('інститут');





alter table department add constraint unique_department_title unique (title);
alter table department add constraint unique_department_head unique (head_id);

insert into department(title, creation_date, head_id, departmenttype_id) values('Факультет інформатики та обчислювальної техніки', NOW() :: DATE, (select id from academic where firstname='Олег' and lastname='Лісовиченко'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Інститут прикладного системного аналізу', NOW() :: DATE, (select id from academic where firstname='Генадій' and lastname='Рябцев'), (select id from departmenttype where type='інститут'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Факультет менеджменту та маркетингу', NOW() :: DATE, (select id from academic where firstname='Наталя' and lastname='Корнієнко'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Теплоенергетичний факультет', NOW() :: DATE, (select id from academic where firstname='Владислав' and lastname='Мамедов'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Зварювальний факультет', NOW() :: DATE, (select id from academic where firstname='Артем' and lastname='Заворикін'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Факультет прикладної математики', NOW() :: DATE, (select id from academic where firstname='Ярослав' and lastname='Корнага'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Факультет соціології і права', NOW() :: DATE, (select id from academic where firstname='Ірина' and lastname='Покулита'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Факультет лінгвістики', NOW() :: DATE, (select id from academic where firstname='Михайло' and lastname='Кушлаба'), (select id from departmenttype where type='факультет'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Фізико-технічний інститут', NOW() :: DATE, (select id from academic where firstname='Аліна' and lastname='Курочкіна'), (select id from departmenttype where type='інститут'));
insert into department(title, creation_date, head_id, departmenttype_id) values('Радіотехнічний факультет', NOW() :: DATE, (select id from academic where firstname='Alex' and lastname='Brown'), (select id from departmenttype where type='факультет'));





alter table building add constraint unique_adress unique (adress);
alter table building add constraint unique_number unique (number);

insert into building(adress, auditoriums_amount, floors_amount, number) values('просп. Перемоги 1', 100, 5, 1);
insert into building(adress, auditoriums_amount, floors_amount, number) values('просп. Перемоги 3', 250, 7, 2);
insert into building(adress, auditoriums_amount, floors_amount, number) values('просп. Перемоги 5', 150, 6, 3);
insert into building(adress, auditoriums_amount, floors_amount, number) values('вул. академіка Янгеля,10', 500, 12, 7);
insert into building(adress, auditoriums_amount, floors_amount, number) values('вул. Металістів, 15а', 60, 4, 12);
insert into building(adress, auditoriums_amount, floors_amount, number) values('вул. Виборзька, 123б', 120, 5, 18);
insert into building(adress, auditoriums_amount, floors_amount, number) values('просп. Перемоги, 110', 250, 8, 4);
insert into building(adress, auditoriums_amount, floors_amount, number) values('просп. Перемоги, 220', 300, 12, 9);
insert into building(adress, auditoriums_amount, floors_amount, number) values('вул. академіка Янгеля, 35', 400, 10, 11);
insert into building(adress, auditoriums_amount, floors_amount, number) values('вул. Металістів, 21в', 110, 5, 19);





alter table auditorium add constraint unique_auditorium_in_building unique (building_id, number);

insert into auditorium(capacity, building_id, computers_availibility, number) values(35, (select id from building where number=1), 't', 201);
insert into auditorium(capacity, building_id, computers_availibility, number) values(110, (select id from building where number=2), 'f', 301);
insert into auditorium(capacity, building_id, computers_availibility, number) values(50, (select id from building where number=3), 'f', 438);
insert into auditorium(capacity, building_id, computers_availibility, number) values(27, (select id from building where number=7), 't', 415);
insert into auditorium(capacity, building_id, computers_availibility, number) values(300, (select id from building where number=9), 'f', 418);
insert into auditorium(capacity, building_id, computers_availibility, number) values(100, (select id from building where number=12), 'f', 402);
insert into auditorium(capacity, building_id, computers_availibility, number) values(65, (select id from building where number=11), 'f', 407);
insert into auditorium(capacity, building_id, computers_availibility, number) values(20, (select id from building where number=18), 't', 432);
insert into auditorium(capacity, building_id, computers_availibility, number) values(15, (select id from building where number=18), 't', 538);
insert into auditorium(capacity, building_id, computers_availibility, number) values(18, (select id from building where number=18), 't', 339);





alter table cathedra add constraint unique_cathedra_title unique (title);
alter table cathedra add constraint unique_cathedra_dean unique (dean_id);

insert into cathedra(title, department_id, dean_id) values('Кафедра технічної кібернетики', (select id from department where title='Факультет інформатики та обчислювальної техніки'), (select id from academic where firstname='Олег' and lastname='Лісовиченко'));
insert into cathedra(title, department_id, dean_id) values('Кафедра системного проектування', (select id from department where title='Інститут прикладного системного аналізу'), (select id from academic where firstname='Генадій' and lastname='Рябцев'));
insert into cathedra(title, department_id, dean_id) values('Кафедра менеджементу', (select id from department where title='Факультет менеджменту та маркетингу'), (select id from academic where firstname='Наталя' and lastname='Корнієнко'));
insert into cathedra(title, department_id, dean_id) values('Кафедра теоретичної та промислової теплотехніки', (select id from department where title='Теплоенергетичний факультет'), (select id from academic where firstname='Владислав' and lastname='Мамедов'));
insert into cathedra(title, department_id, dean_id) values('Кафедра інженерії поверхні', (select id from department where title='Зварювальний факультет'), (select id from academic where firstname='Артем' and lastname='Заворикін'));
insert into cathedra(title, department_id, dean_id) values('Кафедра прикладної математики', (select id from department where title='Факультет прикладної математики'), (select id from academic where firstname='Ярослав' and lastname='Корнага'));
insert into cathedra(title, department_id, dean_id) values('Кафедра соціології', (select id from department where title='Факультет соціології і права'), (select id from academic where firstname='Ірина' and lastname='Покулита'));
insert into cathedra(title, department_id, dean_id) values('Кафедра української мови, літератури та культури', (select id from department where title='Факультет лінгвістики'), (select id from academic where firstname='Михайло' and lastname='Кушлаба'));
insert into cathedra(title, department_id, dean_id) values('Кафедра інформаційної безпеки', (select id from department where title='Фізико-технічний інститут'), (select id from academic where firstname='Аліна' and lastname='Курочкіна'));
insert into cathedra(title, department_id, dean_id) values('Кафедра теоретичних основ радіотехніки', (select id from department where title='Радіотехнічний факультет'), (select id from academic where firstname='Alex' and lastname='Brown'));





alter table cathedraemployee add constraint unique_academic unique (academic_id);

insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Олег' and lastname='Лісовиченко'), (select id from cathedra where title='Кафедра технічної кібернетики'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Генадій' and lastname='Рябцев'), (select id from cathedra where title='Кафедра системного проектування'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Наталя' and lastname='Корнієнко'), (select id from cathedra where title='Кафедра менеджементу'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Владислав' and lastname='Мамедов'), (select id from cathedra where title='Кафедра теоретичної та промислової теплотехніки'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Артем' and lastname='Заворикін'), (select id from cathedra where title='Кафедра інженерії поверхні'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Ярослав' and lastname='Корнага'), (select id from cathedra where title='Кафедра прикладної математики'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Ірина' and lastname='Покулита'), (select id from cathedra where title='Кафедра соціології'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Михайло' and lastname='Кушлаба'), (select id from cathedra where title='Кафедра української мови, літератури та культури'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Аліна' and lastname='Курочкіна'), (select id from cathedra where title='Кафедра інформаційної безпеки'));
insert into cathedraemployee(academic_id, cathedra_id) values((select id from academic where firstname='Alex' and lastname='Brown'), (select id from cathedra where title='Кафедра теоретичних основ радіотехніки'));





alter table discipline add constraint unique_title unique (title);

insert into discipline(title, description) values('Бази даних', 'Вивчення базових знань про бази даних, правила їх проектування, запити. Виконання практичних робіт з інфологічного, даталогічно проектування, нормалізації. Фізична реалізація у вибраній студентом СУБД та написання запитів для неї');
insert into discipline(title, description) values('Основи програмування', 'Дисципліна для отримання базових знань в області програмування');
insert into discipline(title, description) values('Основи менеджменту', 'Дисципліна для отримання базових знань в області менеджменту');
insert into discipline(title, description) values('Основи теплотехніки', 'Дисципліна для отримання базових знань в області теплотехніки');
insert into discipline(title, description) values('Основи зварювання', 'Дисципліна для отримання базових знань в області зварювання');
insert into discipline(title, description) values('Основи прикладної математики', 'Дисципліна для отримання базових знань в області прикладної математики');
insert into discipline(title, description) values('Основи права', 'Дисципліна для отримання базових знань в області права');
insert into discipline(title, description) values('Українська мова', 'Дисципліна для отримання базових знань з української мови');
insert into discipline(title, description) values('Основи інформаційної безпеки', 'Дисципліна для отримання базових знань в області інформаційної безпеки');
insert into discipline(title, description) values('Основи радіотехніки', 'Дисципліна для отримання базових знань в області радіотехніки');





alter table specialty add constraint unique_specialty_area_code unique (area, code);
alter table specialty add constraint unique_specialty_title unique (title);

insert into specialty(area, code, title) values(12, 1, 'Інженерія програмного забезпечення');
insert into specialty(area, code, title) values(12, 2, 'Комп`ютерні науки');
insert into specialty(area, code, title) values(07, 3, 'Менеджмент');
insert into specialty(area, code, title) values(14, 4, 'Теплоенергетика');
insert into specialty(area, code, title) values(13, 1, 'Прикладна механіка');
insert into specialty(area, code, title) values(11, 3, 'Прикладна математика');
insert into specialty(area, code, title) values(08, 1, 'Право');
insert into specialty(area, code, title) values(03, 5, 'Філологія');
insert into specialty(area, code, title) values(12, 5, 'Кібербезпека');
insert into specialty(area, code, title) values(17, 2, 'Телекомунікації та радіотехніка');





alter table scientificproposal add constraint unique_scientificproposal unique (cathedra_id, specialty_id);

insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра технічної кібернетики'), (select id from specialty where area=12 and code=1));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра системного проектування'), (select id from specialty where area=12 and code=2));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра менеджементу'), (select id from specialty where area=07 and code=3));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра теоретичної та промислової теплотехніки'), (select id from specialty where area=14 and code=4));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра інженерії поверхні'), (select id from specialty where area=13 and code=1));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра прикладної математики'), (select id from specialty where area=11 and code=3));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра соціології'), (select id from specialty where area=08 and code=1));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра української мови, літератури та культури'), (select id from specialty where area=03 and code=5));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра інформаційної безпеки'), (select id from specialty where area=12 and code=5));
insert into scientificproposal(cathedra_id, specialty_id) values((select id from cathedra where title='Кафедра теоретичних основ радіотехніки'), (select id from specialty where area=17 and code=2));





alter table class add constraint unique_class_title unique (title);
alter table class add constraint unique_class_curator unique (curator_id);

insert into class(title, scientificproposal_id, curator_id) values('ІТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра технічної кібернетики') and specialty_id=(select id from specialty where area=12 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')));
insert into class(title, scientificproposal_id, curator_id) values('СА-71', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра системного проектування') and specialty_id=(select id from specialty where area=12 and code=2)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Рябцев')));
insert into class(title, scientificproposal_id, curator_id) values('ММ-73', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра менеджементу') and specialty_id=(select id from specialty where area=07 and code=3)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Корнієнко')));
insert into class(title, scientificproposal_id, curator_id) values('ТФ-74', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра теоретичної та промислової теплотехніки') and specialty_id=(select id from specialty where area=14 and code=4)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Мамедов')));
insert into class(title, scientificproposal_id, curator_id) values('ЗФ-71', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра інженерії поверхні') and specialty_id=(select id from specialty where area=13 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Заворикін')));
insert into class(title, scientificproposal_id, curator_id) values('ПМ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра прикладної математики') and specialty_id=(select id from specialty where area=11 and code=3)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Корнага')));
insert into class(title, scientificproposal_id, curator_id) values('СП-73', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра соціології') and specialty_id=(select id from specialty where area=08 and code=1)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Покулита')));
insert into class(title, scientificproposal_id, curator_id) values('ФЛ-74', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра української мови, літератури та культури') and specialty_id=(select id from specialty where area=03 and code=5)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Кушлаба')));
insert into class(title, scientificproposal_id, curator_id) values('ФТ-71', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра інформаційної безпеки') and specialty_id=(select id from specialty where area=12 and code=5)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Курочкіна')));
insert into class(title, scientificproposal_id, curator_id) values('РТ-72', (select id from scientificproposal where cathedra_id=(select id from cathedra where title='Кафедра теоретичних основ радіотехніки') and specialty_id=(select id from specialty where area=17 and code=2)), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Brown')));






alter table controltype add constraint unique_type unique (type);

insert into controltype(type, description) values('Іспит', 'Іспит - це форма контролю роботи студентів, яка може являти собою письмове завжання, усне опитування, практичне завдання або їх комбінацію.');
insert into controltype(type, description) values('Екзамен', 'Екзамен - це форма контролю роботи студентів, яка може являти собою письмове завжання, усне опитування, практичне завдання або їх комбінацію та на відміну від іспиту має більший вплив на успішність студента та рішення щодо отримання стипендії. Екзамен може проводитися лише з профільних предметів');
insert into controltype(type, description) values('Курсова', 'Курсова - це форма контролю роботи студентів, яка завжди являє собою практичне завдання з обов`язковим оформленням документації. Оцінка за курсову виставляється так само як і за інші типи контролю');





alter table subjectteaching add constraint unique_subjectteaching unique (discipline_id, cathedraemployee_id, class_id);

insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Бази даних'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Лісовиченко')), (select id from class where title='ІТ-72'), (select id from controltype where type='Екзамен'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи програмування'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Рябцев')), (select id from class where title='СА-71'), (select id from controltype where type='Іспит'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи менеджменту'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Корнієнко')), (select id from class where title='ММ-73'), (select id from controltype where type='Екзамен'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи теплотехніки'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Мамедов')), (select id from class where title='ТФ-74'), (select id from controltype where type='Курсова'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи зварювання'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Заворикін')), (select id from class where title='ЗФ-71'), (select id from controltype where type='Іспит'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи прикладної математики'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Корнага')), (select id from class where title='ПМ-72'), (select id from controltype where type='Екзамен'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи права'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Покулита')), (select id from class where title='СП-73'), (select id from controltype where type='Курсова'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Українська мова'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Кушлаба')), (select id from class where title='ФЛ-74'), (select id from controltype where type='Іспит'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи інформаційної безпеки'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Курочкіна')), (select id from class where title='ФТ-71'), (select id from controltype where type='Екзамен'));
insert into subjectteaching(basic_discipline, discipline_id, cathedraemployee_id, class_id, controltype_id) values('t', (select id from discipline where title='Основи радіотехніки'), (select id from cathedraemployee where academic_id=(select id from academic where lastname='Brown')), (select id from class where title='РТ-72'), (select id from controltype where type='Курсова'));




alter table student add constraint unique_student_fullname unique (firstname, middlename, lastname);

insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Поліна', 'Анатоліївна', 'Сергієнко', 't', (select id from class where title='ІТ-72'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Ірина', 'Анатоліївна', 'Матвійчук', 't', (select id from class where title='СА-71'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Володимир', 'Олегович', 'Мазур', 't', (select id from class where title='ММ-73'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Ганна', 'Віталіївна', 'Руденко', 't', (select id from class where title='ТФ-74'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Назар', 'Богданович', 'Федоренко', 't', (select id from class where title='ЗФ-71'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Юлія', 'Петрівна', 'Новак', 't', (select id from class where title='ПМ-72'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Андрій', 'Андрійович', 'Рудий', 't', (select id from class where title='СП-73'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Марія', 'Георгіївна', 'Дідович', 't', (select id from class where title='ФЛ-74'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Святослав', 'Костянтинович', 'Кавун', 't', (select id from class where title='ФТ-71'));
insert into student(firstname, middlename, lastname, hostel_need, class_id) values('Кирило', 'Семенович', 'Зікратий', 't', (select id from class where title='РТ-72'));





alter table exam add constraint unique_exam_per_student unique (student_id, subjectteaching_id);

insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 100, (select id from student where firstname='Поліна' and lastname='Сергієнко'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Бази даних') and class_id=(select id from class where title='ІТ-72'))), (select id from auditorium where number=538 and building_id=(select id from building where number=18)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 100, (select id from student where firstname='Ірина' and lastname='Матвійчук'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи програмування') and class_id=(select id from class where title='СА-71'))), (select id from auditorium where number=301 and building_id=(select id from building where number=2)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 100, (select id from student where firstname='Володимир' and lastname='Мазур'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи менеджменту') and class_id=(select id from class where title='ММ-73'))), (select id from auditorium where number=438 and building_id=(select id from building where number=3)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 60, (select id from student where firstname='Ганна' and lastname='Руденко'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи теплотехніки') and class_id=(select id from class where title='ТФ-74'))), (select id from auditorium where number=415 and building_id=(select id from building where number=7)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 75, (select id from student where firstname='Назар' and lastname='Федоренко'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи зварювання') and class_id=(select id from class where title='ЗФ-71'))), (select id from auditorium where number=418 and building_id=(select id from building where number=9)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 83, (select id from student where firstname='Юлія' and lastname='Новак'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи прикладної математики') and class_id=(select id from class where title='ПМ-72'))), (select id from auditorium where number=402 and building_id=(select id from building where number=12)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 94, (select id from student where firstname='Андрій' and lastname='Рудий'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи права') and class_id=(select id from class where title='СП-73'))), (select id from auditorium where number=407 and building_id=(select id from building where number=11)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 62, (select id from student where firstname='Марія' and lastname='Дідович'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Українська мова') and class_id=(select id from class where title='ФЛ-74'))), (select id from auditorium where number=432 and building_id=(select id from building where number=18)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 78, (select id from student where firstname='Святослав' and lastname='Кавун'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи інформаційної безпеки') and class_id=(select id from class where title='ФТ-71'))), (select id from auditorium where number=201 and building_id=(select id from building where number=1)));
insert into exam(time, mark, student_id, subjectteaching_id, auditorium_id) values (NOW() :: DATE, 91, (select id from student where firstname='Кирило' and lastname='Зікратий'), ((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи радіотехніки') and class_id=(select id from class where title='РТ-72'))), (select id from auditorium where number=339 and building_id=(select id from building where number=18)));





alter table lesson add constraint unique_lesson unique (subjectteaching_id, time);

insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Бази даних') and class_id=(select id from class where title='ІТ-72')), NOW() :: DATE, (select id from auditorium where number=538 and building_id=(select id from building where number=18)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи програмування') and class_id=(select id from class where title='СА-71')), NOW() :: DATE, (select id from auditorium where number=301 and building_id=(select id from building where number=2)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи менеджменту') and class_id=(select id from class where title='ММ-73')), NOW() :: DATE, (select id from auditorium where number=438 and building_id=(select id from building where number=3)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи теплотехніки') and class_id=(select id from class where title='ТФ-74')), NOW() :: DATE, (select id from auditorium where number=415 and building_id=(select id from building where number=7)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи зварювання') and class_id=(select id from class where title='ЗФ-71')), NOW() :: DATE, (select id from auditorium where number=418 and building_id=(select id from building where number=9)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи прикладної математики') and class_id=(select id from class where title='ПМ-72')), NOW() :: DATE, (select id from auditorium where number=402 and building_id=(select id from building where number=12)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи права') and class_id=(select id from class where title='СП-73')), NOW() :: DATE, (select id from auditorium where number=407 and building_id=(select id from building where number=11)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Українська мова') and class_id=(select id from class where title='ФЛ-74')), NOW() :: DATE, (select id from auditorium where number=432 and building_id=(select id from building where number=18)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи інформаційної безпеки') and class_id=(select id from class where title='ФТ-71')), NOW() :: DATE, (select id from auditorium where number=201 and building_id=(select id from building where number=1)));
insert into lesson(subjectteaching_id, time, auditorium_id) values((select id from subjectteaching where discipline_id=(select id from discipline where title='Основи радіотехніки') and class_id=(select id from class where title='РТ-72')), NOW() :: DATE, (select id from auditorium where number=339 and building_id=(select id from building where number=18)));




alter table privelege add constraint unique_privelege_title unique (name);

insert into privelege(name, discount) values('інвалід 1 групи', 100);
insert into privelege(name, discount) values('дитина учасника АТО', 50);
insert into privelege(name, discount) values('дитина-сирота', 100);
insert into privelege(name, discount) values('дитина з багатодітної сім`ї', 50);
insert into privelege(name, discount) values('учасник бойових дій', 100);
insert into privelege(name, discount) values('дитина шахтаря', 50);
insert into privelege(name, discount) values('потерпілі внаслідок Чорнобильської катастрофи', 50);
insert into privelege(name, discount) values('особи з інвалідністю внаслідок війни', 100);
insert into privelege(name, discount) values('дитина з малозабезпеченої сім`ї', 50);
insert into privelege(name, discount) values('дитина непрацездатних батьків', 100);





alter table hostel add constraint unique_hostel_head unique (head);

insert into hostel(number, head) values(8, 'Тимошенко Н.В.');
insert into hostel(number, head) values(10, 'Смішний Г.Г.');
insert into hostel(number, head) values(1, 'Дорошенко А.К.');
insert into hostel(number, head) values(2, 'Крикун О.В.');
insert into hostel(number, head) values(3, 'Іваненко Н.Р.');
insert into hostel(number, head) values(4, 'Сидоров Н.С.');
insert into hostel(number, head) values(5, 'Міщенко К.В.');
insert into hostel(number, head) values(6, 'Бондаренко М.С.');
insert into hostel(number, head) values(7, 'Біла А.В.');
insert into hostel(number, head) values(9, 'Чорна І.К.');





insert into roomtype(name, price) values('коридорний', 560);
insert into roomtype(name, price) values('блочний', 700);





alter table room add constraint unique_room_in_hostel unique (hostel_id, roomtype_id);

insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=8), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 3, (select id from hostel where number=10), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=1), (select id from roomtype where name='блочний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=2), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=3), (select id from roomtype where name='блочний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 3, (select id from hostel where number=4), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=5), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=6), (select id from roomtype where name='коридорний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 3, (select id from hostel where number=7), (select id from roomtype where name='блочний'));
insert into room(number, capacity, hostel_id, roomtype_id) values(1, 4, (select id from hostel where number=9), (select id from roomtype where name='коридорний'));




alter table hostelresident add constraint unique_hostelresident unique (student_id);

insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Навики роботи з комп`ютером, знання англійської мови, Microsoft Office', (select id from student where firstname='Поліна' and lastname='Сергієнко'), (select id from room where number=1 and hostel_id=(select id from hostel where number=8)), (select id from privelege where name='дитина учасника АТО'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Навики роботи з комп`ютером, знання англійської мови, гра на фортепіано', (select id from student where firstname='Ірина' and lastname='Матвійчук'), (select id from room where number=1 and hostel_id=(select id from hostel where number=10)), (select id from privelege where name='дитина з багатодітної сім`ї'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Навики роботи з комп`ютером, знання англійської мови, гра на гітарі', (select id from student where firstname='Володимир' and lastname='Мазур'), (select id from room where number=1 and hostel_id=(select id from hostel where number=1)), (select id from privelege where name='учасник бойових дій'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Малювання, вишивання, література', (select id from student where firstname='Ганна' and lastname='Руденко'), (select id from room where number=1 and hostel_id=(select id from hostel where number=2)), (select id from privelege where name='інвалід 1 групи'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Спорт (баскетбол, футбол)', (select id from student where firstname='Назар' and lastname='Федоренко'), (select id from room where number=1 and hostel_id=(select id from hostel where number=3)), (select id from privelege where name='дитина-сирота'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Фотографія, режисура', (select id from student where firstname='Юлія' and lastname='Новак'), (select id from room where number=1 and hostel_id=(select id from hostel where number=4)), (select id from privelege where name='дитина шахтаря'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Кулінарія', (select id from student where firstname='Андрій' and lastname='Рудий'), (select id from room where number=1 and hostel_id=(select id from hostel where number=5)), (select id from privelege where name='потерпілі внаслідок Чорнобильської катастрофи'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Рафтинг', (select id from student where firstname='Марія' and lastname='Дідович'), (select id from room where number=1 and hostel_id=(select id from hostel where number=6)), (select id from privelege where name='особи з інвалідністю внаслідок війни'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Велоспорт', (select id from student where firstname='Святослав' and lastname='Кавун'), (select id from room where number=1 and hostel_id=(select id from hostel where number=7)), (select id from privelege where name='дитина з малозабезпеченої сім`ї'));
insert into hostelresident(abilities, student_id, room_id, previlege_id) values('Фігурне катання', (select id from student where firstname='Кирило' and lastname='Зікратий'), (select id from room where number=1 and hostel_id=(select id from hostel where number=9)), (select id from privelege where name='дитина непрацездатних батьків'));




alter table cheque add constraint unique_payment_period unique (start_date, end_date, hostelresident_id);

insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 280, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Поліна' and lastname='Сергієнко')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 100, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Ірина' and lastname='Матвійчук')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 15, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Володимир' and lastname='Мазур')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 15, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Ганна' and lastname='Руденко')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 15, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Назар' and lastname='Федоренко')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 280, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Юлія' and lastname='Новак')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 280, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Андрій' and lastname='Рудий')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 15, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Марія' and lastname='Дідович')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 280, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Святослав' and lastname='Кавун')));
insert into cheque(payment_date, sum, start_date, end_date, hostelresident_id) values(NOW() :: DATE, 15, NOW() :: DATE, NOW() :: DATE, (select id from hostelresident where student_id=(select id from student where firstname='Кирило' and lastname='Зікратий')));





alter table inventory add constraint unique_inventory_name unique (name);

insert into inventory(name, count) values('матрац', 1);
insert into inventory(name, count) values('покривало', 1);
insert into inventory(name, count) values('ковдра', 1);
insert into inventory(name, count) values('подушка', 1);
insert into inventory(name, count) values('постільна білизна', 1);
insert into inventory(name, count) values('стілець', 1);
insert into inventory(name, count) values('полиця', 1);
insert into inventory(name, count) values('стіл', 1);
insert into inventory(name, count) values('тумба', 1);
insert into inventory(name, count) values('шафа', 1);




alter table doinventory add constraint one_inventory_type_per_hostelresident unique (inventory_id, hostelresident_id);

insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='матрац'), (select id from hostelresident where student_id=(select id from student where firstname='Поліна' and lastname='Сергієнко')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='покривало'), (select id from hostelresident where student_id=(select id from student where firstname='Ірина' and lastname='Матвійчук')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='ковдра'), (select id from hostelresident where student_id=(select id from student where firstname='Володимир' and lastname='Мазур')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='подушка'), (select id from hostelresident where student_id=(select id from student where firstname='Ганна' and lastname='Руденко')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='постільна білизна'), (select id from hostelresident where student_id=(select id from student where firstname='Назар' and lastname='Федоренко')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='стілець'), (select id from hostelresident where student_id=(select id from student where firstname='Юлія' and lastname='Новак')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='полиця'), (select id from hostelresident where student_id=(select id from student where firstname='Андрій' and lastname='Рудий')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='стіл'), (select id from hostelresident where student_id=(select id from student where firstname='Марія' and lastname='Дідович')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='тумба'), (select id from hostelresident where student_id=(select id from student where firstname='Святослав' and lastname='Кавун')));
insert into doinventory(inventory_date, inventory_id, hostelresident_id) values(NOW() :: DATE, (select id from inventory where name='шафа'), (select id from hostelresident where student_id=(select id from student where firstname='Кирило' and lastname='Зікратий')));
