SELECT fName, lName, DOB
FROM
Staff, (SELECT max(DOB) AS maxDOB FROM Staff) YoungestDOB
WHERE
Staff.DOB=YoungestDOB.maxDOB;
/*
Answer:
'Mary', 'Howe', '1970-01-19'
*/