CREATE TABLE students(
  id INT UNSIGNED AUTO_INCREMENT,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  user_name varchar(30) UNIQUE NOT NULL,
  student_id INT(9) UNIQUE NOT NULL,
  registered DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (id)
);