CREATE TABLE analysis.e_dianping_name AS 
SELECT DISTINCT "name", "type", "category" 
FROM detail_space.e_dianping_dtl
ORDER BY "name", "type", "category" 
;

CREATE TABLE analysis.e_mxj_name AS 
SELECT DISTINCT "brand_name", "category" 
FROM detail_space.e_mxj_dtl
ORDER BY "brand_name", "category" 
;

CREATE TABLE analysis.l_hospital_name AS 
SELECT DISTINCT "name", "type", "typecode" 
FROM detail_space.l_hospital_dtl
ORDER BY "name", "type", "typecode" 
;

CREATE TABLE analysis.m_food_amap_name AS 
SELECT DISTINCT "name", "type", "typecode" 
FROM detail_space.m_food_amap_dtl
ORDER BY "name", "type", "typecode" 
;

CREATE TABLE analysis.m_hotel_amap_name AS 
SELECT DISTINCT "name", "type", "typecode" 
FROM detail_space.m_hotel_amap_dtl
ORDER BY "name", "type", "typecode" 
;

CREATE TABLE analysis.m_ktv_amap_name AS 
SELECT DISTINCT "name", "type", "typecode" 
FROM detail_space.m_ktv_amap_dtl
ORDER BY "name", "type", "typecode" 
;

CREATE TABLE analysis.m_shopping_amap_name AS 
SELECT DISTINCT "name", "type", "typecode" 
FROM detail_space.m_shopping_amap_dtl
ORDER BY "name", "type", "typecode" 
;

CREATE TABLE analysis.mall_shopping_data_name AS 
SELECT DISTINCT "name", "tags" 
FROM "public".mall_shopping_data_ods
ORDER BY "name", "tags" 
;

CREATE TABLE analysis.mall_shopping_params_name AS 
SELECT DISTINCT "name"
FROM "public".mall_shopping_params_ods
ORDER BY "name"
;


CREATE TABLE analysis.mall_center_stat AS 
SELECT DISTINCT "name", "bid"
FROM "public".mall_shopping_params_ods
ORDER BY "name"
;