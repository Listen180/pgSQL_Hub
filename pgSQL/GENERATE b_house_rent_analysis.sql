CREATE TABLE analysis.b_house_rent_analysis AS 
SELECT *
FROM detail_space.b_house_rent_dtl
WHERE "src"='lianjia_rent';



UPDATE analysis.b_house_rent_analysis
SET "pubdate" = REPLACE("pubdate", RIGHT("pubdate", 4), '');

ALTER TABLE analysis.b_house_rent_analysis
ALTER COLUMN "pubdate" TYPE INT USING "pubdate"::integer;

UPDATE analysis.b_house_rent_analysis
SET "crawl_time" = REPLACE("crawl_time", RIGHT("crawl_time", 8), '');

ALTER TABLE analysis.b_house_rent_analysis
DROP COLUMN "crawl_date";

ALTER TABLE analysis.b_house_rent_analysis
ALTER COLUMN "crawl_time" TYPE DATE
USING to_date("crawl_time", 'YYYY-MM-DD');

ALTER TABLE analysis.b_house_rent_analysis
ADD "pub_date" date;

UPDATE analysis.b_house_rent_analysis
SET "pub_date"="crawl_time"-"pubdate";