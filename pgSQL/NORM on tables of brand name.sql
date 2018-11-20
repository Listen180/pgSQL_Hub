
SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|\&.*|＆.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|有\.\.\.|有限.*?\.\.\.', '')) AS name_short 
INTO analysis.e_dianping_name_short 
FROM analysis.e_dianping_name;
UPDATE analysis.e_dianping_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.e_dianping_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|\&.*|＆.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|有\.\.\.|有限.*?\.\.\.', '');






SELECT *, 
LOWER(REGEXP_REPLACE("brand_name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.e_mxj_name_short 
FROM analysis.e_mxj_name;
UPDATE analysis.e_mxj_name_short SET "name_short"=REGEXP_REPLACE("brand_name", ' .*', '') WHERE "brand_name" !~*'[a-z]'; 
UPDATE analysis.e_mxj_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');



SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.l_hospital_name_short 
FROM analysis.l_hospital_name;
UPDATE analysis.l_hospital_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.l_hospital_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');





SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|主题餐厅.*|品味干锅.*', '')) AS name_short 
INTO analysis.m_food_amap_name_short 
FROM analysis.m_food_amap_name;
UPDATE analysis.m_food_amap_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.m_food_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.||，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');
UPDATE analysis.m_food_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|（.*?）|（.*?\)|\(.*?店', '') WHERE "name" ~*'\(|\)|（|）|》' AND "name_short" ~*'\(|\)|（|）|》';
UPDATE analysis.m_food_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(|（|《', '') WHERE "name" ~*'\(|\)|（|）|》' AND "name_short" ~*'\(|\)|（|）|》';
UPDATE analysis.m_food_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\)|）|》', '') WHERE "name" ~*'\(|\)|（|）|》' AND "name_short" ~*'\(|\)|（|）|》';




SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.m_hotel_amap_name_short 
FROM analysis.m_hotel_amap_name;
UPDATE analysis.m_hotel_amap_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.m_hotel_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');





SELECT *, 
LOWER(REGEXP_REPLACE("name", ' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.m_ktv_amap_name_short 
FROM analysis.m_ktv_amap_name;
UPDATE analysis.m_ktv_amap_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.m_ktv_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", ' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');




SELECT *, 
LOWER(REGEXP_REPLACE("name", ' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.m_shopping_amap_name_short 
FROM analysis.m_shopping_amap_name;
UPDATE analysis.m_shopping_amap_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.m_shopping_amap_name_short SET "name_short"=REGEXP_REPLACE("name_short", ' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');




SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '')) AS name_short 
INTO analysis.mall_shopping_data_name_short 
FROM analysis.mall_shopping_data_name;
UPDATE analysis.mall_shopping_data_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.mall_shopping_data_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.', '');




SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|-.*?', '')) AS name_short 
INTO analysis.mall_shopping_params_name_short 
FROM analysis.mall_shopping_params_name;
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '购物中心.*?', '购物中心'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '购物广场.*?', '购物广场'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '百货.*?', '百货'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|-.*?', '');
