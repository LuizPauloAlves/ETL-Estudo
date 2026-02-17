INSERT INTO production_tb_categories (category_id, category_name)
SELECT 1,'Children Bicycles' FROM dual UNION ALL
SELECT 2,'Comfort Bicycles' FROM dual UNION ALL
SELECT 3,'Cruisers Bicycles' FROM dual UNION ALL
SELECT 4,'Cyclocross Bicycles' FROM dual UNION ALL
SELECT 5,'Electric Bikes' FROM dual UNION ALL
SELECT 6,'Mountain Bikes' FROM dual UNION ALL
SELECT 7,'Road Bikes' FROM dual;

COMMIT;
