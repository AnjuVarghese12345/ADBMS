create database UNIVERSITY;
use UNIVERSITY;
create table STUDENT(Name varchar(20),Student_number int(50) primary key,Class int(50),Major varchar(20));
create table COURSE(Course_name varchar(30),Course_number varchar(50)primary key,Credit_hours int(50),Department varchar(20));
create table SECTION(Section_identifier int(20) primary key,Course_number varchar(50),Semester varchar(50),Year int(10),Instructor varchar(20),foreign key(Course_number)references COURSE(Course_number));
create table GRADE_REPORT(Student_number int(20),Section_identifier int(20),Grade varchar(20),foreign key(Student_number)references STUDENT(Student_number),foreign key(Section_identifier)references SECTION(Section_identifier));
create table PREREQUISITE(Course_number varchar(50),Prerequisite_number varchar(20)primary key,foreign key(Course_number)references COURSE(Course_number));
use UNIVERSITY;
insert into STUDENT values('Smith',17,1,'CS');
insert into STUDENT values('Brown',8,2,'CS');

insert into COURSE values('Intro to Computer Science','CS1310',4,'CS');
insert into COURSE values('Data Structures','CS3320',4,'CS');
insert into COURSE values('Discrete Mathematics','MATH2410',3,'MATH');
insert into COURSE values('Database','CS3380',3,'CS');

insert into SECTION values(85,'MATH2410','Fall',07,'King');
insert into SECTION values(92,'CS1310','Fall',07,'Anderson');
insert into SECTION values(102,'CS3320','Spring',08,'Knuth');
insert into SECTION values(112,'MATH2410','Fall',08,'Chang');
insert into SECTION values(119,'CS1310','Fall',08,'Anderson');
insert into SECTION values(135,'CS3380','Fall',08,'Stone');

insert into GRADE_REPORT values(17,112,'B');
insert into GRADE_REPORT values(17,119,'C');
insert into GRADE_REPORT values(8,85,'A');
insert into GRADE_REPORT values(8,92,'A');
insert into GRADE_REPORT values(8,102,'B');
insert into GRADE_REPORT values(8,135,'A');

insert into PREREQUISITE values('CS3380','CS3320');
insert into PREREQUISITE values('CS3380','MATH2410');
insert into PREREQUISITE values('CS3320','CS1310');

#3. Retrievethelistofallcoursesandgradesof‘Smith’
SELECT STUDENT.Name,GRADE_REPORT.Grade,COURSE.Course_name FROM STUDENT INNER JOIN GRADE_REPORT ON STUDENT.Student_number=GRADE_REPORT.Student_number INNER JOIN SECTION ON GRADE_REPORT.Section_identifier =SECTION.Section_identifier  INNER JOIN  COURSE ON SECTION.Course_number=COURSE.Course_number WHERE STUDENT.Name='smith';  

#4. List the names of students who took the section of the ‘Database’ course offered in fall2008andtheirgradesinthatsection.
SELECT STUDENT.Name,GRADE_REPORT.Grade,COURSE.Course_name FROM STUDENT INNER JOIN GRADE_REPORT ON STUDENT.Student_number=GRADE_REPORT.Student_Number INNER JOIN SECTION ON GRADE_REPORT.Section_identifier=SECTION.Section_identifier INNER JOIN  COURSE ON SECTION.Course_number=COURSE.Course_number WHERE COURSE.Course_name='Database' AND SECTION.Semester='fall' AND SECTION.Year='08';

#5. List the prerequisites of the ‘Database’ course.	
SELECT PREREQUISITE.Prerequisite_number FROM PREREQUISITE INNER JOIN COURSE ON PREREQUISITE.Course_number=COURSE.Course_number WHERE COURSE.Course_name='Database';

#6. Retrieve the names of all senior students majoring in‘CS’(computerscience).
select Name from STUDENT where Major='CS' and Class=4;

#7. Retrieve the names of all courses taught by Professor King in 2007 and 2008.
SELECT COURSE.Course_name FROM SECTION INNER JOIN COURSE ON SECTION.Course_number=COURSE.Course_number WHERE SECTION.Instructor='king' AND SECTION.Year IN('07','08'); 

#8. For each section taught by Professor King, retrieve the course number,semester, year, and number of students who took the section
SELECT SECTION.Course_number,SECTION.Semester,SECTION.Year,count(DISTINCT GRADE_REPORT.Student_number) FROM SECTION INNER JOIN GRADE_REPORT ON GRADE_REPORT.Section_identifier=SECTION.Section_identifier WHERE SECTION.Instructor='king' GROUP BY GRADE_REPORT.Section_identifier;

#9. Retrieve the name and transcript of each senior student (Class = 4)majoring in CS. A transcript includes course name, course number, credit hours, semester, year, and grade for each course completed by the student.
SELECT STUDENT.Name,COURSE.Course_name,COURSE.Course_number,COURSE.Credit_hours,SECTION.Semester,SECTION.Year,GRADE_REPORT.Grade FROM STUDENT INNER JOIN GRADE_REPORT ON GRADE_REPORT.Student_number=STUDENT.Student_number INNER JOIN SECTION ON SECTION.Section_identifier=GRADE_REPORT.Section_identifier INNER JOIN COURSE ON COURSE.Course_number=SECTION.Section_identifier WHERE STUDENT.Class=4;

#10 Write SQL update statements to do the following on the database schema
#A.Insertanewstudent,<‘Johnson’,25,1,‘Math’>,inthedatabase.
INSERT INTO STUDENT VALUES(25,'johnson',1,'Math');		
SELECT * FROM STUDENT;
								
#B.Change the class of student ‘Smith’ to 2.
UPDATE STUDENT SET Class=2 WHERE Name='smith';
SELECT * FROM STUDENT;

#C.Insert a new course,<‘KnowledgeEngineering’,‘CS4390’,3,‘CS’>
INSERT INTO COURSE VALUES('KnowledgeEngineering','CS4390',3,'cs');
SELECT * FROM COURSE;

#D.Delete therecord forthestudentwhose nameis ‘Smith’and whosestudent number is17.
DELETE FROM STUDENT WHERE Name='smith' AND Student_number=17;
SELECT * FROM STUDENT;





