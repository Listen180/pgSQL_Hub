SELECT district_id, pub_date, count(*) FROM analysis.b_house_rent_analysis
WHERE city_id = '257' -- 广州257
GROUP BY district_id, pub_date
ORDER BY pub_date DESC
;