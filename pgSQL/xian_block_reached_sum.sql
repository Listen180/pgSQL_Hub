SELECT "node_id" AS "id", 
ST_ConvexHull("foot_10") AS "polygraph_foot_10"
FROM analysis.xian_block_reached_sum
ORDER BY "id" 
;