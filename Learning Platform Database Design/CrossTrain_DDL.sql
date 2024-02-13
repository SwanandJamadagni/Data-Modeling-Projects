CREATE DATABASE CrossTrain;

USE CrossTrain;

CREATE TABLE COURSE_T
(
Course_ID int(11) AUTO_INCREMENT not null,
Course_Name varchar(30) not null,
Course_Descrition varchar(50) not null,
CONSTRAINT COURSE_pk PRIMARY KEY (course_ID)
);

CREATE TABLE TUTOR_T
(
Tutor_ID int(11) AUTO_INCREMENT not null,
Proficiences varchar(30) not null,
RatePerHour float not null,
Num_of_Hrs float not null,
CONSTRAINT TUTOR_pk PRIMARY KEY (Tutor_ID),
CONSTRAINT TUTOR_fk FOREIGN KEY (Tutor_ID) REFERENCES MEMBER_T (Member_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SYLLABUS_T
(
Course_ID int(11) not null,
Tutor_ID int(11) not null,
Syllabus varchar(100) not null,
CONSTRAINT SYLLABUS_pk PRIMARY KEY (Course_ID,Tutor_ID),
CONSTRAINT SYLLABUS_fk1 FOREIGN KEY (Course_ID) REFERENCES COURSE_T (Course_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT SYLLABUS_fk2 FOREIGN KEY (Tutor_ID) REFERENCES TUTOR_T (Tutor_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE EARNINGS_T
(
Tutor_ID int(11) not null,
Amount float not null,
CONSTRAINT EARNINGS_pk PRIMARY KEY (Tutor_ID),
CONSTRAINT EARNINGS_fk FOREIGN KEY (Tutor_ID) REFERENCES TUTOR_T (Tutor_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE STUDENT_T
(
Student_ID int(11) AUTO_INCREMENT not null,
InterestedIn varchar(30) not null,
CONSTRAINT STUDENT_pk PRIMARY KEY (Student_ID),
CONSTRAINT STUDENT_fk FOREIGN KEY (Student_ID) REFERENCES MEMBER_T (Member_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE INVOICE_T
(
Invoice_ID int(11) AUTO_INCREMENT not null,
Invoice_Amount float not null,
Student_ID int(11) not null,
Tutor_ID int(11) not null,
Course_ID int(11) not null,
CONSTRAINT INVOICE_pk PRIMARY KEY (Invoice_ID),
CONSTRAINT INVOICE_fk1 FOREIGN KEY (Student_ID) REFERENCES STUDENT_T (Student_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT INVOICE_fk2 FOREIGN KEY (Tutor_ID) REFERENCES TUTOR_T (Tutor_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT INVOICE_fk3 FOREIGN KEY (Course_ID) REFERENCES COURSE_T (Course_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE GRADES_T
(
Student_ID int(11) not null,
Tutor_ID int(11) not null,
Course_ID int(11) not null,
Assignment_Type varchar(30) not null,
Score_Received float not null,
Max_Score float not null,
Grade varchar(2) not null,
CONSTRAINT GRADES_pk PRIMARY KEY (Student_ID,Tutor_ID,Course_ID),
CONSTRAINT GRADES_fk1 FOREIGN KEY (Student_ID) REFERENCES STUDENT_T (Student_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT GRADES_fk2 FOREIGN KEY (Tutor_ID) REFERENCES TUTOR_T (Tutor_ID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT GRADES_fk3 FOREIGN KEY (Course_ID) REFERENCES COURSE_T (Course_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SESSION_T
(
Session_ID int(11) AUTO_INCREMENT not null,
Session_Date date not null,
Session_Time varchar(8) not null,
Session_Duration float,
Course_ID int(11) not null,
CONSTRAINT SESSION_pk PRIMARY KEY (Session_ID),
CONSTRAINT SESSION_fk FOREIGN KEY (Course_ID) REFERENCES COURSE_T(Course_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE visitor_T
(
visitor_id int(11) AUTO_INCREMENT not null,
visitor_date date,
visit_time varchar(8),
visit_duration float,
num_visits int(3),
device_types varchar(20),
platform varchar(20),
visitor_type varchar(20),
CONSTRAINT visitor_pk PRIMARY KEY (visitor_id)
);

CREATE TABLE unregistered_T
(
visitor_id int(11),
ip_address varchar(30),
visitor_name varchar(50),
email varchar(30),
phone int(10),
CONSTRAINT unregistered_pk PRIMARY KEY (visitor_id),
CONSTRAINT unregistered_fk1 FOREIGN KEY (visitor_id) REFERENCES visitor_T (visitor_id)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE member_T
(
member_id int(11) AUTO_INCREMENT not null,
visitor_id int(11),
member_name varchar(50),
age int(2),
address varchar(30),
qualification varchar(20),
work_expereince varchar(10),
rating varchar(20),
member_type varchar(20),
CONSTRAINT member_pk PRIMARY KEY (member_id,visitor_id),
CONSTRAINT member_fk FOREIGN KEY (visitor_id) REFERENCES visitor_T(visitor_id)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE certifications_T
(
member_id int(11),
certifications_type_id varchar(50),
member_certificate_name varchar(50),
provider varchar(20),
issue_date date,
expiry_date date,
CONSTRAINT member_pk PRIMARY KEY (member_id, certifications_type_id),
CONSTRAINT member_fk1 FOREIGN KEY (member_id) REFERENCES member_T (member_id)
ON UPDATE CASCADE ON DELETE CASCADE
);