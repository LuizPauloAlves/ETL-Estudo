/*
-- Total de Unidades Vendidas por Marca
-- Identificar quais marcas têm o maior volume de vendas em pedidos finalizados.
1º - Relacionamento: JOIN em 4 tabelas (orders → order_items → products → brands)
2º - Filtro: Apenas pedidos com status = 4 (Finalizados)
3º - Agrupamento: Por brand_name
4º - Soma: Total de unidades vendidas (order_item_quantity)
5º - Ordenação: Decrescente por quantidade total
*/
select ptb.brand_name, 
       sum(stoi.order_item_quantity) as total_quantidade
from sales_tb_orders sto
join sales_tb_order_items stoi on sto.order_id = stoi.order_id
join production_tb_products ptp on stoi.product_id = ptp.product_id
join production_tb_brands ptb on ptp.brand_id = ptb.brand_id
where sto.order_status = 4
group by ptb.brand_name
order by total_quantidade DESC;