DELIMITER //

CREATE TRIGGER after_student_locations_insert
    AFTER INSERT ON student_locations FOR EACH ROW

    BEGIN 

    INSERT INTO activity_logs (student_id, location_id, action)
    VALUES
    (NEW.student_id, NEW.location_id, 'IN');

    END //

CREATE TRIGGER before_student_locations_delete
    BEFORE DELETE ON student_locations FOR EACH ROW

    BEGIN

    INSERT INTO activity_logs (student_id, location_id, action)
    VALUES
    (OLD.student_id, OLD.location_id, 'OUT');

    END //

DELIMITER ;