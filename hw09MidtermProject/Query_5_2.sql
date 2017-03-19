SELECT Client.fName, Client.lName
FROM 
Client,
Viewing,
(SELECT propertyNo
	FROM
	PropertyForRent, (SELECT min(rent) minRent FROM PropertyForRent) CheapestRent
    WHERE
	PropertyForRent.rent=CheapestRent.minRent) CheapestProperty
WHERE
Client.clientNo=Viewing.clientNo
AND
Viewing.propertyNo=CheapestProperty.propertyNo;
/*
Answer:
'Aline', 'Stewart'
'John', 'Kay'
*/