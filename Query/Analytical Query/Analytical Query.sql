-- AQ1
-- Ranking popularitas model mobil berdasarkan jumlah bid

SELECT c.model, COUNT(c.car_id) as jumlah_produk, COUNT(b.bid_id) as jumlah_bid
FROM car c
LEFT JOIN advertisement a ON c.car_id = a.car_id
LEFT JOIN bid b ON a.ad_id = b.ad_id
GROUP BY c.model
ORDER BY jumlah_produk desc;

-- AQ2
-- Membandingkan harga mobil berdasarkan harga rata-rata per kota

SELECT 
    location.city_name, car.brand, car.model, car.year, car.price,
    ROUND(SUM(car.price) OVER (PARTITION BY location.city_name) / 
		  COUNT(car.price) OVER (PARTITION BY location.city_name)) AS rerata_harga_kota
FROM location
JOIN user_account ON user_account.location_id = location.location_id
JOIN advertisement ON advertisement.user_id = user_account.user_id
JOIN car ON car.car_id = advertisement.car_id
GROUP BY location.city_name, car.brand, car.model, car.year, car.price
ORDER BY city_name ASC;


-- AQ3
-- Dari penawaran suatu model mobil, cari perbandingan tanggal user melakukan bid dengan bid selanjutnya 
-- beserta harga tawar yang diberikan, Contoh: Bid untuk model mobil: Toyota Yaris.

SELECT *
FROM (SELECT 
        bid.ad_id, advertisement.title, bid.bidder_id as id_penawar_pertama,
		LEAD(bid.bidder_id) OVER(PARTITION BY bid.ad_id ORDER BY bid.date_bid) AS id_penawar_selanjutnya,
        bid.date_bid as tanggal_penawaran_pertama,
        LEAD(bid.date_bid) OVER(PARTITION BY bid.ad_id ORDER BY bid.date_bid) AS tanggal_penawaran_selanjutnya,
        bid.bid_price as harga_penawaran_pertama,
        LEAD(bid.bid_price) OVER(PARTITION BY bid.ad_id ORDER BY bid.date_bid) AS harga_penawaran_selanjutnya
    FROM bid
    JOIN advertisement ON bid.ad_id = advertisement.ad_id) AS subquery
WHERE tanggal_penawaran_selanjutnya IS NOT NULL AND subquery.title LIKE '%Yaris%'
ORDER BY ad_id ASC;

-- AQ4
-- Membandingkan persentase perbedaan rata-rata harga mobil berdasarkan modelnya 
-- dan rata-rata harga bid yang ditawarkan oleh customer pada 6 bulan terakhir
SELECT 
    car.model,
    CAST(AVG(car.price) AS INTEGER) AS avg_price,
    CAST(AVG(bid.bid_price) FILTER (WHERE bid.date_bid >= current_date - INTERVAL '6 months') AS INTEGER) AS avg_bid_6month,
    CAST((AVG(car.price) - AVG(bid.bid_price) 
		  FILTER (WHERE bid.date_bid >= current_date - INTERVAL '6 months')) AS INTEGER) AS difference,
    CAST(((AVG(car.price) - AVG(bid.bid_price) FILTER (WHERE bid.date_bid >= current_date - INTERVAL '6 months')) 
		  / AVG(car.price)) * 100 AS INTEGER) AS difference_percent
FROM car
JOIN advertisement ON car.car_id = advertisement.car_id
LEFT JOIN bid ON advertisement.ad_id = bid.ad_id
GROUP BY car.model
ORDER BY difference_percent DESC;

-- AQ5
-- Membuat window function rata-rata harga bid sebuah merk dan model mobil selama 6 bulan terakhir.

SELECT 
	c.brand, c.model,
    AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '6 months' THEN b.bid_price ELSE NULL END) AS m_min_6,
	AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '5 months' THEN b.bid_price ELSE NULL END) AS m_min_5,
	AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '4 months' THEN b.bid_price ELSE NULL END) AS m_min_4,
	AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '3 months' THEN b.bid_price ELSE NULL END) AS m_min_3,
	AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '2 months' THEN b.bid_price ELSE NULL END) AS m_min_2,
	AVG(CASE WHEN b.date_bid >= current_date - INTERVAL '1 months' THEN b.bid_price ELSE NULL END) AS m_min_1
FROM 
	advertisement as ad
	JOIN car as c ON ad.car_id = c.car_id
	JOIN bid as b ON ad.ad_id = b.ad_id
GROUP BY c.brand, c.model;

