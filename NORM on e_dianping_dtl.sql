-- ALTER TABLE analysis.e_dianping_name DROP "name_short";
-- ALTER TABLE analysis.e_dianping_name ADD "name_short" text;
-- UPDATE analysis.e_dianping_name SET "name_short"="name";
-- UPDATE analysis.e_dianping_name SET "name_short"=REGEXP_REPLACE("name", ' .*|\(.*?\)|（.*?）|【.*?】', ''); 


--去掉空格及之后的内容 --去掉括号中的内容（包括括号） --去掉中文括号中的内容（包括括号）  --去掉中文方括号中的内容（包括方括号）
-- \-.*?.|\..*?.|
SELECT *, 
REGEXP_REPLACE("name", ' .*|\(.*?\)|\(.*?）|\(.*?】|\(.*?\.\.\.|（.*?）|（.*?\)|（.*?】|（.*?\.\.\.|【.*?】|【.*?\)|【.*?）|【.*?\.\.\.|《|》〈|〉|，|·.*|\&.*|＆.*|●.*|•.*|\*.*|\@.*?.|\..*?\.\.\.|\/.*?\.\.\.|有\.\.\.|有限.*?\.\.\.', '') AS name_short 
INTO analysis.e_dianping_name_short 
FROM analysis.e_dianping_name;

-- SELECT *, REGEXP_REPLACE("name_short", '', '') AS name_short2 into analysis.e_dianping_name_short2 from analysis.e_dianping_name_short;

/* End w/ some characters */
--UPDATE analysis.e_dianping_name_short SET "name_short"=REGEXP_REPLACE("name_short", '分局.*?\...', '分局'); 
UPDATE analysis.e_dianping_name_short SET "name_short"=REGEXP_REPLACE("name_short", '[a-z].*[a-z]', ''); 


-- 主题餐厅
-- 品味干锅

--  统一大小写



SELECT * FROM analysis.e_dianping_name_short
WHERE	--"name" ~'\(.*?\)' OR 
	"name" ~'（.*?\.\.\.|有.*?\.\.\.|分局.*?\...|\..*?\.\.\.|【.*?】' -- |\(.*?\.\.\.
	AND "type"='10'
ORDER BY "name_short" DESC
LIMIT 2000;

SELECT * FROM analysis.e_dianping_name_short
WHERE	
	"name_short" ~*'[a-z].*[a-z]' 
	AND "type"='10'
ORDER BY "name_short" DESC
LIMIT 2000;