
SELECT "bid", 
"floor", 
ROUND("area_convex") AS "area_convex", 
"count"
FROM analysis.mall_area 
WHERE "bid"~'1263920197023039487|11874932565035049810'
ORDER BY "bid", "floor"
;










SELECT DISTINCT "bid" 
FROM public.mall_shopping_data_ods 
;





SELECT t2."bid", 
t1."name", 
COUNT(*) AS "record_count"
FROM public.mall_shopping_data_ods AS t2 
LEFT JOIN (SELECT "bid", "name" FROM public.mall_shopping_params_ods) AS t1 
ON t2.bid = t1.bid 
GROUP BY t2."bid", t1."name" 
ORDER BY t2."bid", t1."name" 
;

