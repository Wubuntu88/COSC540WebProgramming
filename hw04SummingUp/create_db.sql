CREATE DATABASE hw04db;
use hw04db;
CREATE TABLE Item (
  id INT(2) UNSIGNED PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  cost INT(3) NOT NULL);

INSERT INTO Item (id, name, cost) VALUES (20, 'Pen', 2);
INSERT INTO Item (id, name, cost) VALUES (55, 'Pencil', 1);
INSERT INTO Item (id, name, cost) VALUES (57, 'Paper', 30);
INSERT INTO Item (id, name, cost) VALUES (60, 'Stapler', 50);
