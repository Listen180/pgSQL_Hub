CREATE TABLE analysis.mall_cord AS 
SELECT "bid", 
"shop_name", 
"floor", 
"tags", 
"floor_tag", 
"lat_a", "lng_a"
FROM analysis.mall_tag_temp
WHERE "floor_tag"!~'停车场|车位' --OR "floor"~'B'
ORDER BY "bid", "floor"
;


CREATE TABLE analysis.mall_area AS
SELECT "bid", 
"floor", 
COUNT(*), 
--ST_Union(ST_SetSRID(ST_MakePoint("lng_a", "lat_a"), 4326)) AS "geom"
--ST_Area(ST_ConcaveHull(ST_Union(ST_SetSRID(ST_MakePoint("lng_a", "lat_a"), 4326)), 0.8)::geography) AS "area_concave"
ST_Area(ST_ConvexHull(ST_Union(ST_SetSRID(ST_MakePoint("lng_a", "lat_a"), 4326)))::geography) AS "area_convex"
FROM analysis.mall_cord
GROUP BY "bid", "floor"
ORDER BY "bid", "floor"
;




SELECT *
FROM analysis.mall_cord
WHERE "bid"='1045358856770370419'