INSERT INTO production_tb_brands (brand_id, brand_name)
SELECT 1,'Electra' FROM dual UNION ALL
SELECT 2,'Haro' FROM dual UNION ALL
SELECT 3,'Heller' FROM dual UNION ALL
SELECT 4,'Pure Cycles' FROM dual UNION ALL
SELECT 5,'Ritchey' FROM dual UNION ALL
SELECT 6,'Strider' FROM dual UNION ALL
SELECT 7,'Sun Bicycles' FROM dual UNION ALL
SELECT 8,'Surly' FROM dual UNION ALL
SELECT 9,'Trek' FROM dual;

COMMIT;
