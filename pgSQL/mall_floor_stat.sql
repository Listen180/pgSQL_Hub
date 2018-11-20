SELECT *, 
LOWER(REGEXP_REPLACE("name", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|-.*?', '')) AS name_short 
INTO analysis.mall_shopping_params_name_short 
FROM analysis.mall_shopping_params_name;
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name", ' .*', '') WHERE "name" !~*'[a-z]'; 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '购物中心.*?', '购物中心'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '购物广场.*?', '购物广场'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '百货.*?', '百货'); 
UPDATE analysis.mall_shopping_params_name_short SET "name_short"=REGEXP_REPLACE("name_short", '\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|《.*》|〈.*〉|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|，|·.*|＆.*|®.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|-.*?', '');
