CREATE TABLE student_locations(
  id INT UNSIGNED AUTO_INCREMENT,
  student_id INT UNSIGNED NOT NULL,
  location_id INT UNSIGNED NOT NULL,

  PRIMARY KEY (id),

  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE
);