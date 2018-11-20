CREATE TABLE analysis.mall_area AS 
SELECT "bid", 
--"shop_name", 
"floor", 
--"tags", 
--"floor_tag", 
"lat_a", "lng_a"
FROM analysis.mall_tag_temp
WHERE "bid"='1266589871384821759' AND "floor_tag"!~'普通停车位'
ORDER BY "floor"
;







SELECT "bid", "name"
FROM mall_shopping_params_ods
LIMIT 1000;