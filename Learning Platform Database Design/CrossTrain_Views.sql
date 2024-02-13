/*VIEW #01*/
CREATE VIEW v_member_info AS
SELECT visitor_T.visitor_id, visitor_date, visit_time, member_name, age, qualification, rating, member_type 
FROM visitor_T INNER JOIN member_T ON visitor_T.visitor_id=member_T.visitor_id;

/*VIEW #02*/
CREATE VIEW v_student_info AS
SELECT student_T.student_id, interestedin, tutor_id, course_id, assignment_type, score_received, max_score, grade
FROM student_T INNER JOIN grades_T ON student_T.student_id = grades_T.student_id;

/*VIEW #03*/
CREATE VIEW v_tutor_info AS
SELECT tutor_T.tutor_id, Proficiences, rateperhour, num_of_hrs, invoice_T.course_id
FROM tutor_T INNER JOIN invoice_T ON tutor_T.tutor_id = invoice_T.tutor_id INNER JOIN course_T 
ON invoice_T.course_id = course_T.course_id;