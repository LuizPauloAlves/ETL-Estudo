INSERT INTO sales_tb_staffs (staff_id, staff_first_name, staff_last_name, staff_email, staff_phone, staff_active, store_id, manager_id)
SELECT 1,'Fabiola','Jackson','fabiola.jackson@bikes.shop','(831) 555-5554',1,1,NULL FROM dual UNION ALL
SELECT 2,'Mireya','Copeland','mireya.copeland@bikes.shop','(831) 555-5555',1,1,1.0 FROM dual UNION ALL
SELECT 3,'Genna','Serrano','genna.serrano@bikes.shop','(831) 555-5556',1,1,2.0 FROM dual UNION ALL
SELECT 4,'Virgie','Wiggins','virgie.wiggins@bikes.shop','(831) 555-5557',1,1,2.0 FROM dual UNION ALL
SELECT 5,'Jannette','David','jannette.david@bikes.shop','(516) 379-4444',1,2,1.0 FROM dual UNION ALL
SELECT 6,'Marcelene','Boyer','marcelene.boyer@bikes.shop','(516) 379-4445',1,2,5.0 FROM dual UNION ALL
SELECT 7,'Venita','Daniel','venita.daniel@bikes.shop','(516) 379-4446',1,2,5.0 FROM dual UNION ALL
SELECT 8,'Kali','Vargas','kali.vargas@bikes.shop','(972) 530-5555',1,3,1.0 FROM dual UNION ALL
SELECT 9,'Layla','Terrell','layla.terrell@bikes.shop','(972) 530-5556',1,3,7.0 FROM dual UNION ALL
SELECT 10,'Bernardine','Houston','bernardine.houston@bikes.shop','(972) 530-5557',1,3,7.0 FROM dual;

COMMIT;
