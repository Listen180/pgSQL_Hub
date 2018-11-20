SELECT t2."bid", 
t1."name", 
"floor", 
ROUND("area_convex") AS "area_convex", 
"count"
FROM analysis.mall_area AS t2 
INNER JOIN (SELECT "bid", "name" FROM public.mall_shopping_params_ods) AS t1 
ON t2.bid = t1.bid 
--ORDER BY "bid", "floor"
ORDER BY t2."count" 
;

--问题bid：10673916474412576188 -- 


CREATE TABLE analysis.mall_area_sum AS
SELECT t2."bid", 
t1."name", 
SUM(ROUND("area_convex")) AS "area_sum", 
MIN(ROUND("area_convex")) AS "area_min", 
MAX(ROUND("area_convex")) AS "area_max", 
ROUND(AVG("area_convex")) AS "area_avg", 
SUM("count") AS "shop_count", 
COUNT(*) AS "floor_count", 
SUM(ROUND("area_convex"))*COUNT(*)  AS "area_max_sum"
FROM analysis.mall_area AS t2 
INNER JOIN (SELECT "bid", "name" FROM public.mall_shopping_params_ods) AS t1 
ON t2.bid = t1.bid 
GROUP BY t2."bid", t1."name" 
ORDER BY t2."bid", t1."name" 
;



/*
SELECT "bid", "name"
FROM mall_shopping_params_ods
LIMIT 1000;
*/

