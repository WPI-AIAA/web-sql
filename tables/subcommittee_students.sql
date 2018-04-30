CREATE TABLE subcommittee_students(
    id INT UNSIGNED AUTO_INCREMENT,
    student_id INT UNSIGNED NOT NULL,
    committee_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (committee_id) REFERENCES subcommittees(id) ON DELETE CASCADE
);