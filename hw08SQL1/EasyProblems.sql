#2)
SELECT B.arrival_time, G.first_name, G.last_name
FROM booking AS B, guest AS G
WHERE
B.booking_date='2016-11-05'
AND
G.id=B.guest_id
ORDER BY B.arrival_time;

#3)
SELECT B.booking_id, B.room_type_requested, B.occupants, R.amount
FROM booking as B, rate as R
WHERE B.room_type_requested=R.room_type
AND
B.occupants=R.occupancy
AND
B.booking_id IN (5152, 5165, 5154, 5295)

#4) //NO INPUT BOX

#5)
SELECT G.id, COUNT(B.booking_id), SUM(nights)
FROM guest as G, booking as B
WHERE
G.id=B.guest_id
AND
G.id IN (1185, 1270)
GROUP BY G.id
