SELECT fName, lName, DOB
FROM
Staff
JOIN
(SELECT staffNo, min(DOB) FROM Staff) YoungestEmployee
ON
Staff.staffNo=YoungestEmployee.staffNo;
/*
Answer:
'Mary', 'Howe', '1970-01-19'
*/