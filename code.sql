#online education system

#drop statements

DROP TABLE USER_QUIZ;
DROP TABLE USER_DISCUSSION;
DROP TABLE USER_ANSWERS;
DROP TABLE QUESTIONS;
DROP TABLE QUIZ;
DROP TABLE ASSIGNMENT_MARKS;
DROP TABLE ASSIGNMENT;
DROP TABLE NOTIFICATION_TYPE;
DROP TABLE NOTIFICATION;
DROP TABLE COURSE_TAUGHT;
DROP TABLE FACULTY;
DROP TABLE ADDITIONAL_MATERIAL;
DROP TABLE DISCUSSION_FORUM;
DROP TABLE FEEDBACK;
DROP TABLE STUDENT_COURSE;
DROP TABLE TOPIC;
DROP TABLE COURSE;
DROP TABLE USERS;

#SQL CREATE STATEMENTS

CREATE TABLE USERS
(
USER_ID INT NOT NULL,
FNAME VARCHAR (15) NOT NULL,
LNAME VARCHAR (15) NOT NULL,
PASSWORD VARCHAR (15) NOT NULL,
BDATE DATE,
PHONE_NUM CHAR (10),
EMAIL VARCHAR (30) NOT NULL,
ADDRESS VARCHAR (30),
GENDER CHAR,
PRIMARY KEY (USER_ID)
);
CREATE TABLE COURSE
(
COURSE_ID INT NOT NULL,
CNAME VARCHAR (15) NOT NULL,
C_DESCRIPTION VARCHAR (500),
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
STATUS CHAR NOT NULL,
PRIMARY KEY (COURSE_ID)
);
CREATE TABLE TOPIC
(
TOPIC_ID INT NOT NULL,
TNAME VARCHAR (15) NOT NULL,
T_DESCRIPTION VARCHAR (500),
CID INT NOT NULL,
PRIMARY KEY (TOPIC_ID),
FOREIGN KEY (CID) REFERENCES COURSE (COURSE_ID) ON DELETE CASCADE
Online Education System
);
CREATE TABLE STUDENT_COURSE
(
S_USER_ID INT NOT NULL,
S_COURSE_ID INT NOT NULL,
PRIMARY KEY (S_USER_ID, S_COURSE_ID),
FOREIGN KEY (S_USER_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE,
FOREIGN KEY (S_COURSE_ID) REFERENCES COURSE (COURSE_ID) ON DELETE CASCADE
);
CREATE TABLE FEEDBACK
(
FEEDBACK_ID INT NOT NULL,
U_ID INT NOT NULL,
FDATE DATE,
FEEDBACK VARCHAR (500) NOT NULL,
PRIMARY KEY (FEEDBACK_ID),
FOREIGN KEY (U_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE
);
CREATE TABLE DISCUSSION_FORUM
(
DISS_ID INT NOT NULL,
TID INT NOT NULL,
EMAIL VARCHAR (30) NOT NULL,
CDATE DATE NOT NULL,
PRIMARY KEY (DISS_ID),
FOREIGN KEY (TID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE
);
CREATE TABLE ADDITIONAL_MATERIAL
(
AM_ID INT NOT NULL,
TID INT NOT NULL,
URL VARCHAR (200) NOT NULL,
PRIMARY KEY (AM_ID),
FOREIGN KEY (TID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE
);
CREATE TABLE FACULTY
(
FACULTY_ID INT NOT NULL,
FNAME VARCHAR (15) NOT NULL,
LNAME VARCHAR (15) NOT NULL,
GENDER CHAR,
BDATE DATE,
PHONE_NUM CHAR (10),
EMAIL VARCHAR (30) NOT NULL,
ADDRESS VARCHAR (30),
PRIMARY KEY (FACULTY_ID)
);
CREATE TABLE COURSE_TAUGHT
(
CID INT NOT NULL,
FID INT NOT NULL,
PRIMARY KEY (CID,FID),
FOREIGN KEY (CID) REFERENCES COURSE (COURSE_ID) ON DELETE CASCADE,
FOREIGN KEY (FID) REFERENCES FACULTY (FACULTY_ID) ON DELETE CASCADE
);
CREATE TABLE NOTIFICATION
(
NOTIF_ID INT NOT NULL,
TID INT NOT NULL,
Online Education System
NOTIF_DESC VARCHAR(500) NOT NULL,
PRIMARY KEY (NOTIF_ID),
FOREIGN KEY (TID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE
);
CREATE TABLE NOTIFICATION_TYPE
(
NOTIF_ID INT NOT NULL,
NOTIF_TYPE VARCHAR(500) NOT NULL,
PRIMARY KEY (NOTIF_ID, NOTIF_TYPE),
FOREIGN KEY (NOTIF_ID) REFERENCES NOTIFICATION (NOTIF_ID) ON DELETE CASCADE
);
CREATE TABLE ASSIGNMENT
(
ASSIGN_ID INT NOT NULL,
TID INT NOT NULL,
DUE_DATE DATE,
PRIMARY KEY (ASSIGN_ID),
FOREIGN KEY (TID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE
);
CREATE TABLE ASSIGNMENT_MARKS
(
ASSIGN_ID INT NOT NULL,
U_ID INT NOT NULL,
TOTAL_POINS FLOAT,
PRIMARY KEY (ASSIGN_ID, U_ID),
FOREIGN KEY (ASSIGN_ID) REFERENCES ASSIGNMENT (ASSIGN_ID),
FOREIGN KEY (U_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE
);
CREATE TABLE QUIZ
(
QUIZ_ID INT NOT NULL,
TID INT NOT NULL,
LVLS INT NOT NULL,
PRIMARY KEY (QUIZ_ID),
FOREIGN KEY (TID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE
);
CREATE TABLE QUESTIONS
(
QUESTION_ID INT NOT NULL,
QZ_ID INT NOT NULL,
QUESTION VARCHAR(500) NOT NULL,
PRIMARY KEY (QUESTION_ID,QZ_ID),
FOREIGN KEY (QZ_ID) REFERENCES QUIZ (QUIZ_ID)
);
CREATE TABLE USER_ANSWERS
(
QID INT NOT NULL,
U_ID INT NOT NULL,
ANSWER VARCHAR(100),
QZ_ID INT NOT NULL,
PRIMARY KEY (U_ID,QID,QZ_ID),
FOREIGN KEY (U_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE,
FOREIGN KEY (QID,QZ_ID) REFERENCES QUESTIONS (QUESTION_ID,QZ_ID) ON DELETE CASCADE
);
CREATE TABLE USER_DISCUSSION
(
U_ID INT NOT NULL,
DID INT NOT NULL,
FCOMMENTS VARCHAR(400),
PRIMARY KEY (U_ID, DID),
Online Education System
FOREIGN KEY (U_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE,
FOREIGN KEY (DID) REFERENCES DISCUSSION_FORUM (DISS_ID) ON DELETE CASCADE
);
CREATE TABLE USER_QUIZ
(
U_ID INT NOT NULL,
QZ_ID INT NOT NULL,
SCORE INT NOT NULL,
PRIMARY KEY (U_ID, QZ_ID),
FOREIGN KEY (U_ID) REFERENCES USERS (USER_ID) ON DELETE CASCADE,
FOREIGN KEY (QZ_ID) REFERENCES QUIZ (QUIZ_ID) ON DELETE CASCADE
);


#INSERT STATEMENTS

insert into USERS (USER_ID, FNAME, LNAME, PASSWORD, BDATE, PHONE_NUM, EMAIL, ADDRESS, GENDER) values (1,'tushar','bhatia','123','10-JAN-93','8789876576','txb@gmail.com','7824 Mcclum blvd','m');
insert into USERS (USER_ID, FNAME, LNAME, PASSWORD, BDATE, PHONE_NUM, EMAIL, ADDRESS, GENDER) values (2,'aruksha','singh','124','12-FEB-93','8989876576','axg@gmail.com','7774 Mcclum blvd','f');
insert into USERS (USER_ID, FNAME, LNAME, PASSWORD, BDATE, PHONE_NUM, EMAIL, ADDRESS, GENDER) values (3,'panchami','rudrakshi','125','16-MAR-92','8787765576','pgr@gmail.com','7825 Mcclum blvd','f');
insert into USERS (USER_ID, FNAME, LNAME, PASSWORD, BDATE, PHONE_NUM, EMAIL, ADDRESS, GENDER) values (4,'jai','arora','111','12-FEB-90','8988909576','jai@gmail.com','7904 Mcclum blvd','m');
insert into USERS (USER_ID, FNAME, LNAME, PASSWORD, BDATE, PHONE_NUM, EMAIL, ADDRESS, GENDER) values (5,'raghu','NR','100','06-FEB-91','8000909576','raghu@gmail.com','7000Mcclum blvd','m');
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (1,'statistics','analysis of statistical methods for data scientist','01-JAN-15','01-MAR-15',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (2,'database design','database design and storage analysis','01-OCT-15','01-DEC-15',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (3,'sdn','transferring control components to software','01-NOV-15','01-JAN-16',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (4,'ML','pattern recognition and computational learning theory in artificial intelligence','01-NOV-15','01-FEB-16',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (5,'bigdata','sets so large or complex that traditional data processing applications','01-MAY-16','01-AUG-16',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (6,'statistics','analysis of statistical methods for data scientist','01-JAN-16','01-MAR-16',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (7,'database design','database design and storage analysis','01-DEC-15','01-JAN-16',0);
insert into COURSE (COURSE_ID, CNAME, C_DESCRIPTION, START_DATE, END_DATE,STATUS) values (8,'sdn','transferring control components to software','05-DEC-15','01-JAN-16',0);
insert into TOPIC (TOPIC_ID,TNAME, T_DESCRIPTION,CID) values (3,'probability','Events and their probabilities',1);
insert into TOPIC (TOPIC_ID, TNAME, T_DESCRIPTION,CID) values (4,'Distributions','',1);
insert into TOPIC (TOPIC_ID, TNAME, T_DESCRIPTION,CID) values (1,'DB','Introduction, actors, advantages and disadvantages',2);
insert into TOPIC (TOPIC_ID,TNAME, T_DESCRIPTION,CID) values (2,'Architecture','System concepts,data models,schemas',2);
insert into TOPIC (TOPIC_ID, TNAME, T_DESCRIPTION,CID) values (5,'SDN Intro','',3);
insert into TOPIC (TOPIC_ID, TNAME, T_DESCRIPTION,CID) values (6,'ML Intro','statistical methods in ML',4);
insert into TOPIC (TOPIC_ID, TNAME, T_DESCRIPTION,CID) values (7 ,'bigdata Intro','data classification and analysis',5);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (1,1);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (1,4);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (2,2);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (2,4);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (2,1);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (3,3);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (3,2);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (4,1);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (4,2);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (5,2);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (1,6);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (2,6);
insert into STUDENT_COURSE (S_USER_ID, S_COURSE_ID) values (3,6);
insert into FEEDBACK (FEEDBACK_ID,U_ID, FDATE, FEEDBACK) values (1,1,'15-JAN-15','very useful study material');
insert into FEEDBACK (FEEDBACK_ID,U_ID, FDATE, FEEDBACK) values (2,2,'20-DEC-15','lectures need to be more detailed');
insert into FEEDBACK (FEEDBACK_ID,U_ID, FDATE, FEEDBACK) values (3,3,'09-NOV-15','good assignments');
insert into FEEDBACK (FEEDBACK_ID,U_ID, FDATE, FEEDBACK) values (4,4,'22-JAN-15','very tough quizzes');
insert into FEEDBACK (FEEDBACK_ID,U_ID, FDATE, FEEDBACK) values (5,5,'11-OCT-15','very poor video quality');
insert into DISCUSSION_FORUM(DISS_ID, TID,EMAIL,CDATE) values (1,1,'txb@gmail.com','01-NOV-15');
insert into DISCUSSION_FORUM(DISS_ID, TID, EMAIL,CDATE) values (2,2,'too@gmail.com','15-NOV-15');
insert into DISCUSSION_FORUM(DISS_ID, TID,EMAIL, CDATE) values (3,3,'asd@gmail.com','01-FEB-15');
insert into DISCUSSION_FORUM(DISS_ID, TID,EMAIL, CDATE) values (4,4,'rtd@gmail.com','29-JAN-15');
insert into DISCUSSION_FORUM(DISS_ID, TID,EMAIL, CDATE) values (5,5,'ryui@gmail.com','11-NOV-15');
insert into DISCUSSION_FORUM(DISS_ID, TID,EMAIL, CDATE) values (6,6,'ropd@gmail.com','01-DEC-15');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (2,1,'What is sql');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (3,2, 'What is nosql');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (4,3, 'What is statistics');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (2,4, 'What is sdn');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (3,5, 'What is ml');
insert into USER_DISCUSSION(U_ID,DID ,FCOMMENTS) values (1,6, 'What is bigdata');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (1,1,'https://drive.google.com/file/d/0B_CXBnxbGzHYR1RuXzM5dlhsbTQ/view?ts=565a2752');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (2,1,' https://www.google.come');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (4,2,' https://en.wikipedia.org/wiki/Statistics');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (5,3,' https://en.wikipedia.org/wiki/Stat');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (6,4,' https://en.wikipedia.org/wiki/Software-defined_networking');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (7,5,' https://en.wikipedia.org/wiki/ml');
insert into ADDITIONAL_MATERIAL (AM_ID, TID, URL) values (8,6,' https://en.wikipedia.org/wiki/Software-defined_networking/bigdata');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (1,'sammy','johnson','m','10-JAN-1963','8780076576','sammy@gmail.com','794 Mcclum blvd');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (2,'joy','culver','m','10-JAN-1973','8009876576','joy@gmail.com','7829 Mcclum blvd');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (3,'pallavi','bhat','f','10-JAN-1979','8789876076','pallavi@gmail.com','7894 Mcclum blvd');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (4,'kavya','raman','f','10-JAN-1980','8709876576','kavya@gmail.com','9824 Mcclum blvd');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (5,'lahari','ganesh','f','10-JAN-1982','8789870576','lahari@gmail.com','7884 Mcclum blvd');
insert into FACULTY(FACULTY_ID,FNAME,LNAME,GENDER,BDATE,PHONE_NUM,EMAIL,ADDRESS)values (6,'ragini','kumar','f','10-JAN-1983','8739870576','ragini@gmail.com','7824 Mcclum blvd');
insert into COURSE_TAUGHT(CID ,FID ) values (1,1);
insert into COURSE_TAUGHT(CID ,FID ) values (2,2);
insert into COURSE_TAUGHT(CID ,FID ) values (3,3);
insert into COURSE_TAUGHT(CID ,FID ) values (4,4);
insert into COURSE_TAUGHT(CID ,FID ) values (5,5);
insert into COURSE_TAUGHT(CID ,FID ) values (6,1);
insert into COURSE_TAUGHT(CID ,FID ) values (7,2);
insert into COURSE_TAUGHT(CID ,FID ) values (8,6);
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (1,1,'Assignment submission due today');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (2,2,'Reserve seat for Exam 2');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (3,3,'Negative marking for late submission');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (4,4,'Todays classes cancelled');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (5,5,'Project posted');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (6,6,'Exam marks posted');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (7,1,'Classes postponed');
insert into NOTIFICATION(NOTIF_ID,TID,NOTIF_DESC)values (8,1,'HW posted');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (1,'Assignment');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (2,'Exam');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (3,'Assignment');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (4,'Class');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (5,'Project');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (6,'Exam');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (7,'Class');
insert into NOTIFICATION_TYPE(NOTIF_ID,NOTIF_TYPE)values (8,'HW');
insert into QUIZ(QUIZ_ID,TID,LVLS) values (1,1,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (2,1,2);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (3,1,3);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (4,2,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (5,2,2);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (6,2,3);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (7,3,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (8,3,2);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (9,4,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (10,5,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (11,5,2);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (12,6,1);
insert into QUIZ(QUIZ_ID,TID, LVLS) values (13,6,2);
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (1,1,'What is DB ');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (2,2,'What is SQL');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (3,3,'What is MONGODB');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (4,4,'What is STATISTICS');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (5,5,'What is REGRESSION');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (6,6,'What is MONTE CARLO');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (7,7,'What is DATA ANALYSIS');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (8,8,'What is UNIVARIATION');
insert into QUESTIONS(QUESTION_ID, QZ_ID,QUESTION) values (9,9,'What is MULTI TASKING');
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (7,1,'a structured set of data ',7);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (1,2,'abc ',1);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (9,4,'def',9);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (5,5,'ghi ',5);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (8,2,'jkl ',8);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (6,3,'mno ',6);
insert into USER_ANSWERS(QID, U_ID, ANSWER,QZ_ID) values (3,4,'pqr ',3);
insert into USER_QUIZ (u_id,QZ_ID,score) values(1,7,90);
insert into USER_QUIZ (u_id,QZ_ID,score) values(2,1,80);
insert into USER_QUIZ (u_id,QZ_ID,score) values(3,10,95);
insert into USER_QUIZ (u_id,QZ_ID,score) values(4,9,70);
insert into USER_QUIZ (u_id,QZ_ID,score) values(5,5,80);
insert into USER_QUIZ (u_id,QZ_ID,score) values(1,12,60);
insert into USER_QUIZ (u_id,QZ_ID,score) values(2,13,76);
insert into USER_QUIZ (u_id,QZ_ID,score) values(2,8,89);
insert into USER_QUIZ (u_id,QZ_ID,score) values(3,6,90);
insert into USER_QUIZ (u_id,QZ_ID,score) values(4,3,100);
insert into ASSIGNMENT (ASSIGN_ID,TID,DUE_DATE)values (1,1,'10-OCT-15');
insert into ASSIGNMENT (ASSIGN_ID,TID,DUE_DATE)values (2,2,'15-NOV-15');
insert into ASSIGNMENT (ASSIGN_ID,TID,DUE_DATE)values (3,3,'12-DEC-15');
insert into ASSIGNMENT (ASSIGN_ID,TID,DUE_DATE)values (4,4,'20-FEB-15');
insert into ASSIGNMENT (ASSIGN_ID,TID,DUE_DATE)values (5,5,'10-DEC-15');
insert into ASSIGNMENT_MARKS(ASSIGN_ID,U_ID,TOTAL_POINS) values (1,2,100);
insert into ASSIGNMENT_MARKS(ASSIGN_ID,U_ID,TOTAL_POINS) values (2,5,90);
insert into ASSIGNMENT_MARKS(ASSIGN_ID,U_ID,TOTAL_POINS) values (3,1,80);
insert into ASSIGNMENT_MARKS(ASSIGN_ID,U_ID,TOTAL_POINS) values (4,4,95);
insert into ASSIGNMENT_MARKS(ASSIGN_ID,U_ID,TOTAL_POINS) values (5,3,85);
