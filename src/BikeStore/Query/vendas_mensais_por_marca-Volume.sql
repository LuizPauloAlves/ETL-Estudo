/*
-- Vendas Mensais por Marca (Volume)
-- Análise da quantidade total vendida de cada marca por mês em pedidos finalizados.
1º - Relacionamento: JOIN em 4 tabelas (orders → order_items → products → brands)
2º - Filtro: Apenas pedidos com status = 4 (Finalizados/Enviados)
3º - Agrupamento: Por marca e mês de envio
4º - Soma: Total de unidades vendidas (order_item_quantity) por marca/mês
5º - Ordenação: Cronológica por mês, depois decrescente por quantidade dentro de cada mês
*/
select ptb.brand_name, 
       TO_CHAR(sto.order_shipped_date, 'MM/YY') as mes,
       sum(stoi.order_item_quantity) as total_quantidade
from sales_tb_orders sto
join sales_tb_order_items stoi on sto.order_id = stoi.order_id
join production_tb_products ptp on stoi.product_id = ptp.product_id
join production_tb_brands ptb on ptp.brand_id = ptb.brand_id
where sto.order_status = 4
group by ptb.brand_name, TO_CHAR(sto.order_shipped_date, 'MM/YY')
order by MIN(sto.order_shipped_date), total_quantidade DESC;


/*
-- Vendas Anuais por Marca (Volume)
-- Análise da quantidade total vendida de cada marca por ano em pedidos finalizados.
1º - Relacionamento: JOIN em 4 tabelas (orders → order_items → products → brands)
2º - Filtro: Apenas pedidos com status = 4 (Finalizados/Enviados)
3º - Agrupamento: Por marca e ano de envio
4º - Soma: Total de unidades vendidas (order_item_quantity) por marca/ano
5º - Ordenação: Cronológica por ano, depois decrescente por quantidade dentro de cada ano
--
SELECT ptb.brand_name, 
       TO_CHAR(sto.order_shipped_date, 'YYYY') AS ano,
       SUM(stoi.order_item_quantity) AS total_quantidade
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
JOIN production_tb_products ptp ON stoi.product_id = ptp.product_id
JOIN production_tb_brands ptb ON ptp.brand_id = ptb.brand_id
WHERE sto.order_status = 4
GROUP BY ptb.brand_name, TO_CHAR(sto.order_shipped_date, 'YYYY')
ORDER BY MIN(sto.order_shipped_date), total_quantidade DESC;
--
SELECT ptb.brand_name, 
       TO_CHAR(sto.order_shipped_date, 'YYYY-Q') AS ano,   -- YYYY-Q ou YY-Q é para ver por quartio ou trimetre
       SUM(stoi.order_item_quantity) AS total_quantidade
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
JOIN production_tb_products ptp ON stoi.product_id = ptp.product_id
JOIN production_tb_brands ptb ON ptp.brand_id = ptb.brand_id
WHERE sto.order_status = 4
GROUP BY ptb.brand_name, TO_CHAR(sto.order_shipped_date, 'YYYY-Q')
ORDER BY MIN(sto.order_shipped_date), total_quantidade DESC;

*/