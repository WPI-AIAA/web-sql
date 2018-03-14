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