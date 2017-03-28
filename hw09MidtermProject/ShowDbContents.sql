MariaDB [Wi2017_436_wgilles1]> show tables;
+-------------------------------+
| Tables_in_Wi2017_436_wgilles1 |
+-------------------------------+
| Branch                        |
| Client                        |
| PrivateOwner                  |
| PropertyForRent               |
| Staff                         |
| Viewing                       |
+-------------------------------+
6 rows in set (0.01 sec)

MariaDB [Wi2017_436_wgilles1]> select * from Branch;
+----------+--------------+----------+----------+
| branchNo | street       | city     | postcode |
+----------+--------------+----------+----------+
| b002     | 64 Clover Dr | London   | NW106EU  |
| b003     | 163 Main St  | Glasgow  | G119QX   |
| b004     | 32 Manse Rd  | Bristol  | BS991NZ  |
| b005     | 22 Deer Rd   | London   | SW14EH   |
| b007     | 16 Argyll St | Aberdeen | AB23SU   |
+----------+--------------+----------+----------+
5 rows in set (0.13 sec)

MariaDB [Wi2017_436_wgilles1]> select * from Staff;
+---------+-------+-------+------------+-----+------------+--------+----------+
| staffNo | fName | lName | position   | sex | DOB        | salary | branchNo |
+---------+-------+-------+------------+-----+------------+--------+----------+
| SA9     | Mary  | Howe  | Assistant  | F   | 1970-01-19 |   9000 | b007     |
| SG14    | David | Ford  | Supervisor | M   | 1958-03-24 |  18000 | b003     |
| SG37    | Ann   | Beech | Assistant  | F   | 1960-11-10 |  12000 | b003     |
| SG5     | Susan | Brand | Manager    | F   | 1940-06-03 |  24000 | b003     |
| SL21    | John  | White | Manager    | M   | 1945-10-01 |  30000 | b005     |
| SL41    | Julie | Lee   | Assistant  | F   | 1965-06-03 |   9000 | b005     |
+---------+-------+-------+------------+-----+------------+--------+----------+

MariaDB [Wi2017_436_wgilles1]> select * from PropertyForRent;
+------------+---------------+----------+----------+-------+-------+------+---------+---------+----------+
| propertyNo | street        | city     | postcode | type  | rooms | rent | ownerNo | staffNo | branchNo |
+------------+---------------+----------+----------+-------+-------+------+---------+---------+----------+
| PA14       | 16 Holhead    | Aberdeen | AB755U   | House |     6 |  650 | CO46    | SA9     | b007     |
| PG16       | 5 Novar Dr    | Glasgow  | G129AX   | Flat  |     4 |  450 | CO93    | SG14    | b003     |
| PG21       | 18 Dale Rd    | Glasgow  | G12      | House |     5 |  600 | CO87    | SG37    | b003     |
| PG36       | 2 Manor Rd    | Glasgow  | G324QX   | Flat  |     3 |  375 | CO93    | SG37    | b003     |
| PG4        | 6 Lawrence St | Glasgow  | G119QX   | Flat  |     3 |  350 | CO40    | SG5     | b003     |
| PL94       | 6 Argyll St   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | b005     |
+------------+---------------+----------+----------+-------+-------+------+---------+---------+----------+
6 rows in set (0.02 sec)

MariaDB [Wi2017_436_wgilles1]> select * from Client;
+----------+-------+---------+---------------+----------+---------+------------------------+
| clientNo | fName | lName   | telNo         | prefType | maxRent | eMail                  |
+----------+-------+---------+---------------+----------+---------+------------------------+
| CR56     | Aline | Stewart | 0141-848-1825 | Flat     |     350 | astewart@hotmail.com   |
| CR62     | Mary  | Tregear | 01224-196720  | Flat     |     600 | maryt@hotmail.co.uk    |
| CR74     | Mike  | Ritchie | 01475-392178  | House    |     750 | mritchie01@yahoo.co.uk |
| CR76     | John  | Kay     | 0207-774-5632 | Flat     |     425 | john.kay@gmail.com     |
+----------+-------+---------+---------------+----------+---------+------------------------+
4 rows in set (0.02 sec)

MariaDB [Wi2017_436_wgilles1]> select * from PrivateOwner;
+---------+-------+--------+------------------------------+---------------+-------------------+----------+
| ownerNo | fName | lName  | address                      | telNo         | eMail             | password |
+---------+-------+--------+------------------------------+---------------+-------------------+----------+
| CO40    | Tina  | Murphy | 36 Well St, Glasgow G42      | 0141-943-1728 | tinam@hotmail.com | 12345    |
| CO46    | Joe   | Keogh  | 2 Fergus Dr, Aberdeen AB27XW | 01224-861212  | jkeogh@lhh.com    | 12345    |
| CO87    | Carol | Farrel | 6 Archray St, Glasgow G329DX | 0141-357-7419 | cfarrel@gmail.com | 12345    |
| CO93    | Tony  | Shaw   | 12 Park Pl, Glasgow G40QR    | 0141-225-7025 | tony.shaw@ark.com | 12345    |
+---------+-------+--------+------------------------------+---------------+-------------------+----------+
4 rows in set (0.02 sec)

MariaDB [Wi2017_436_wgilles1]> select * from Viewing;
+----------+------------+------------+----------------+
| clientNo | propertyNo | viewDate   | comments       |
+----------+------------+------------+----------------+
| CR56     | PA14       | 2013-05-24 | too small      |
| CR56     | PG36       | 2013-04-28 | small interior |
| CR56     | PG4        | 2013-05-26 | bad views      |
| CR62     | PA14       | 2013-05-14 | no dining room |
| CR76     | PG4        | 2013-04-20 | too remote     |
+----------+------------+------------+----------------+
