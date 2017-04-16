CREATE DATABASE IF NOT EXISTS doodle_db;

use doodle_db;

CREATE TABLE IF NOT EXISTS schedule_instance(
username varchar(20) NOT NULL,
time1 tinyint(1),
time2 tinyint(1),
time3 tinyint(1),
time4 tinyint(1),
time5 tinyint(1),
time6 tinyint(1),
PRIMARY KEY(username)
);
INSERT INTO
  schedule_instance (username, time1, time2, time3, time4, time5, time6)
VALUES
  ('R. Mika', 1, 0, 1, 0, 0, 1);
