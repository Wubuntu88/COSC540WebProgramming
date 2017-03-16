#6)
SELECT sum(B.nights*R.amount)
FROM guest as G, rate as R, booking as B
WHERE
B.room_type_requested=R.room_type
AND
B.occupants=R.occupancy
AND
B.guest_id=G.id
AND
G.first_name='Ruth'
AND
G.last_name='Cadbury'
GROUP BY G.id;

#7)
SELECT R.amount * B.nights + E.extra_amount as Total
FROM booking as B
JOIN
  rate as R
ON R.room_type=B.room_type_requested AND R.occupancy=B.occupants
JOIN
  (SELECT booking_id, SUM(amount) as extra_amount
  FROM extra
  WHERE booking_id=5128
  GROUP BY booking_id) as E
ON E.booking_id=B.booking_id
WHERE
B.booking_id=5128

#8)
SELECT last_name,first_name, address, SUM(nights) as nights
FROM
    (SELECT last_name,first_name,address,COALESCE(nights,NULL,0) as nights, guest.id as guest_id
    FROM guest
    LEFT JOIN booking
    ON guest.id = booking.guest_id
    WHERE address LIKE "Edinburgh%") as Q
GROUP BY Q.guest_id
ORDER BY last_name, first_name;

#9)
SELECT booking_date, COUNT(booking_id) as arrivals
FROM booking
WHERE booking_date BETWEEN '2016-11-25' AND '2016-12-01'
GROUP BY booking_date
ORDER BY booking_date;

#10)
SELECT SUM(occupants)
FROM booking
WHERE
booking_date <= '2016-11-21'
AND
DATE_ADD(booking_date, INTERVAL nights DAY) > '2016-11-21'
