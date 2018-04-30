CREATE TABLE subcommittees(
    id INT UNSIGNED AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    description TEXT,
    chair_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (chair_id) REFERENCES students(id) ON DELETE CASCADE
);