USE crosstrain;

DESC COURSE_T;
DESC TUTOR_T;
DESC SYLLABUS_T;
DESC EARNINGS_T;
DESC STUDENT_T;
DESC INVOICE_T;
DESC GRADES_T;
DESC SESSION_T;
DESC visitor_T;
DESC unregistered_T;
DESC member_T;
DESC certifications_T;

SELECT COUNT(*) FROM COURSE_T;
SELECT COUNT(*) FROM SYLLABUS_T;
SELECT COUNT(*) FROM TUTOR_T;
SELECT COUNT(*) FROM EARNINGS_T;
SELECT COUNT(*) FROM INVOICE_T;
SELECT COUNT(*) FROM STUDENT_T;
SELECT COUNT(*) FROM GRADES_T;
SELECT COUNT(*) FROM session_T;
SELECT COUNT(*) FROM VISITOR_T;
SELECT COUNT(*) FROM UNREGISTERED_T;
SELECT COUNT(*) FROM MEMBER_T;
SELECT COUNT(*) FROM CERTIFICATIONS_T;

SELECT * FROM COURSE_T;
SELECT * FROM SYLLABUS_T;
SELECT * FROM TUTOR_T;
SELECT * FROM EARNINGS_T;
SELECT * FROM INVOICE_T;
SELECT * FROM STUDENT_T;
SELECT * FROM GRADES_T;
SELECT * FROM session_T;
SELECT * FROM VISITOR_T;
SELECT * FROM UNREGISTERED_T;
SELECT * FROM MEMBER_T;
SELECT * FROM CERTIFICATIONS_T;

/*Top 5 tutors by earnings*/
SELECT Tutor_ID, Amount from EARNINGS_T order by Amount desc limit 5;

/*Proficiency of top 5 paid tutors*/
SELECT T.Tutor_ID, T.Proficiences, E.Amount from TUTOR_T as T LEFT JOIN EARNINGS_T as E 
on T.Tutor_ID = E.Tutor_ID order by E.Amount desc limit 5;

/*Top 5 students by Score*/
SELECT M.Member_Name, G.Score_Received from GRADES_T as G INNER JOIN MEMBER_T as M 
on M.MEMBER_ID = G.STUDENT_ID ORDER BY G.Score_Received DESC LIMIT 5;

/*Subjects for top 5 Student*/
SELECT M.Member_Name, G.Score_Received, S.InterestedIn from GRADES_T as G 
INNER JOIN MEMBER_T as M 
on M.MEMBER_ID = G.STUDENT_ID 
INNER JOIN STUDENT_T as S
on S.STUDENT_ID = G.STUDENT_ID
ORDER BY G.Score_Received DESC LIMIT 5;

/*Top 5 unregistered visitors*/
SELECT U.Visitor_Name, V.Num_Visits from UNREGISTERED_T as U LEFT JOIN VISITOR_T as V
on U.Visitor_ID = V.Visitor_ID
order by V.Num_Visits desc limit 5;

/*VIEWS*/
SELECT * FROM v_tutor_info;
SELECT * FROM v_student_info;
SELECT * FROM v_member_info;

/*Stored Procedures*/
CALL sp_student_by_score(89);
CALL sp_get_visitor_type(832);
CALL sp_get_visitor_type(54);
CALL sp_get_tutor_rate(12);