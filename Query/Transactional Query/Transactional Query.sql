-- TQ1
-- Mencari mobil keluaran 2015 ke atas

SELECT * FROM car
WHERE year >= 2015
order by year asc


-- TQ2
-- Menambahkan satu data bid produk baru

INSERT INTO bid (bid_id, ad_id, bidder_id, date_bid, bid_price, bid_status) 
VALUES (152,99,150,'2023-08-25',355500000,'Sent');

Select * from bid
order by date_bid desc;

-- TQ3
-- Melihat semua mobil yg dijual 1 akun dari yg paling baru
-- Contoh: Mobil yang dijual oleh akun “Ratih Irawan”

SELECT  u.name as seller_name, c.car_id, c.brand, c.model, c.year, c.price, a.date_post
FROM car c
JOIN advertisement a ON c.car_id = a.car_id
JOIN user_account u ON a.user_id = u.user_id
WHERE u.name = 'Ratih Irawan';

-- TQ4
-- Mencari mobil bekas yang termurah berdasarkan keyword
-- Contoh: Berdasarkan keyword “Yaris”

SELECT car_id, brand, model, year, price
FROM Car
WHERE LOWER(model) LIKE '%yaris%'
ORDER BY price ASC;

-- TQ5
-- Mencari mobil bekas yang terdekat berdasarkan sebuah id kota, jarak terdekat dihitung berdasarkan latitude longitude. 
-- Perhitungan jarak dapat dihitung menggunakan rumus jarak euclidean berdasarkan latitude dan longitude.
-- Contoh: mencari mobil terdekat dengan id kota 3173

SELECT c.car_id, c.brand, c.model, c.year, c.price, 
SQRT(POW(l.latitude - (-6.1352), 2) + POW(l.longitude - 106.813301 , 2)) as distance
FROM car c
JOIN advertisement a ON c.car_id = a.car_id
JOIN user_account u ON a.user_id = u.user_id
JOIN location l ON u.location_id = l.location_id
ORDER BY distance;
