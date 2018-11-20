SELECT * FROM analysis.m_food_amap_name_short
--WHERE	
--	"name" ~' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|\&.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|主题餐厅.*|品味干锅.*'
--ORDER BY "name_short" DESC
LIMIT 2000;




SELECT "name_short", COUNT(*) AS "count"
FROM analysis.mall_shopping_params_name_short
GROUP BY "name_short" 
ORDER BY --"count" DESC, 
"name_short" 
LIMIT 2000;

SELECT "name", "name_short"
FROM analysis.mall_shopping_params_name_short
WHERE "name_short" LIKE '新世纪%'
LIMIT 2000;

SELECT "name", "name_short"
FROM analysis.mall_shopping_params_name_short
WHERE "name_short" LIKE '百盛%'
LIMIT 2000;

SELECT "name", "name_short"
FROM analysis.mall_shopping_params_name_short
WHERE "name_short" LIKE '万象%'
LIMIT 2000;

SELECT "name", "name_short"
FROM analysis.mall_shopping_params_name_short
WHERE "name_short" LIKE '%又一城%'
LIMIT 2000;




SELECT * 
FROM analysis.m_food_amap_name_short
WHERE "name" ~*'[a-z]'
;
SELECT * 
FROM analysis.m_food_amap_name_short
WHERE "name" ~*'. .'
;




SELECT * 
FROM analysis.m_food_amap_name_short
WHERE "name" ~*'\(|\)|（|）|》' AND "name_short" ~*'\(|\)|（|）|》'
;


SELECT COUNT(*) 
FROM analysis.m_food_amap_name_short
;

SELECT COUNT(DISTINCT tags) 
FROM analysis.mall_shopping_data_name_short
;
