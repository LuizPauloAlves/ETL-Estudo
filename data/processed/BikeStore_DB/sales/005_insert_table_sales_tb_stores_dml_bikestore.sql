INSERT INTO sales_tb_stores (store_id, store_name, store_phone, store_email, store_street, store_city, store_state, store_zip_code)
SELECT 1,'Santa Cruz Bikes','(831) 476-4321','santacruz@bikes.shop','3700 Portola Drive','Santa Cruz','CA',95060 FROM dual UNION ALL
SELECT 2,'Baldwin Bikes','(516) 379-8888','baldwin@bikes.shop','4200 Chestnut Lane','Baldwin','NY',11432 FROM dual UNION ALL
SELECT 3,'Rowlett Bikes','(972) 530-5555','rowlett@bikes.shop','8000 Fairway Avenue','Rowlett','TX',75088 FROM dual;

COMMIT;
