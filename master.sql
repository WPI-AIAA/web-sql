DROP TABLE activity_logs;
DROP TABLE student_locations;
DROP TABLE student_permissions;
DROP TABLE locations;
DROP TABLE students;


CREATE TABLE students(
  id INT UNSIGNED AUTO_INCREMENT,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  user_name varchar(30) UNIQUE NOT NULL,
  student_id INT(9) UNIQUE NOT NULL,
  registered DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (id)
);

CREATE TABLE locations(
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  state VARCHAR(20) DEFAULT 'CLOSED',
  created DATETIME DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),

  CONSTRAINT check_state CHECK (state IN ('CLOSED', 'OPEN', 'IN USE'))
);

CREATE TABLE student_locations(
  id INT UNSIGNED AUTO_INCREMENT,
  student_id INT UNSIGNED NOT NULL,
  location_id INT UNSIGNED NOT NULL,

  PRIMARY KEY (id),

  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE
);

CREATE TABLE student_permissions(
  id INT UNSIGNED AUTO_INCREMENT,
  student_id INT UNSIGNED NOT NULL,
  location_id INT UNSIGNED NOT NULL,
  permission varchar(20) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE,

  CONSTRAINT check_permission CHECK (permission IN ('monitor', 'access'))
);

CREATE TABLE activity_logs(
  id INT UNSIGNED AUTO_INCREMENT,
  student_id INT UNSIGNED NOT NULL,
  location_id INT UNSIGNED NOT NULL,
  action varchar(30) NOT NULL,
  action_time DATETIME DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE,

  CONSTRAINT check_action CHECK (action IN ('IN', 'OUT', 'OPEN', 'CLOSE'))
);

CREATE TRIGGER after_student_locations_insert
    AFTER INSERT ON student_locations FOR EACH ROW

    BEGIN 

    INSERT INTO activity_logs (student_id, location_id, action)
    VALUES
    (NEW.student_id, NEW.location_id, 'IN');

    END;

CREATE TRIGGER before_student_locations_delete
    BEFORE DELETE ON student_locations FOR EACH ROW

    BEGIN

    INSERT INTO activity_logs (student_id, location_id, action)
    VALUES
    (OLD.student_id, OLD.location_id, 'OUT');

    END;