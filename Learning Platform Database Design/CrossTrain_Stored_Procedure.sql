/*Stored Procedure #01*/
DELIMITER //
CREATE PROCEDURE sp_student_by_score(IN get_score_received float)
begin    
select * from grades_T where score_received = get_score_received;
END //
DELIMITER ;

/*Stored Procedure #02*/
DELIMITER //
CREATE PROCEDURE sp_get_visitor_type(IN get_visitor int(11))
begin    
select visitor_type from visitor_T where visitor_id = get_visitor;
END //
DELIMITER ;

/*Stored Procedure #03*/
DELIMITER //
CREATE PROCEDURE sp_get_tutor_rate(IN get_rateperhr float)
begin    
select rateperhour from tutor_T where tutor_id = get_rateperhr;
END //
DELIMITER ;