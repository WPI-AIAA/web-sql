CREATE TABLE locations(
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  state VARCHAR(20) DEFAULT 'CLOSED',
  created DATETIME DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),

  CONSTRAINT check_state CHECK (state IN ('CLOSED', 'OPEN', 'IN USE'))
);