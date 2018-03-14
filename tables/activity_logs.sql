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