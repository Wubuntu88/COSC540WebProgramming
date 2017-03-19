SELECT 
	EarliestDate.the_date as mostRecentViewing,
	Client.fName,
	Client.lName,
	PropertyForRent.city,
	PropertyForRent.street
FROM
	Client,
    PropertyForRent,
    Viewing,
	(SELECT max(viewDate) the_date FROM Viewing) EarliestDate
WHERE
	Client.clientNo=Viewing.clientNo
    AND
    PropertyForRent.propertyNo=Viewing.propertyNo
    AND
    Viewing.viewDate=EarliestDate.the_date;

/*
Answer:
'2013-05-26', 'Aline', 'Stewart', 'Glasgow', '6 Lawrence St'
*/