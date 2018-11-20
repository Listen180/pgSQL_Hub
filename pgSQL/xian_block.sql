CREATE TABLE "analysis"."xian_block_business" AS 
SELECT "id", "crowd_centroid" 
FROM "analysis"."xian_block_labels"
WHERE "is_busi_area"=1
;