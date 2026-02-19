/*
-- Qual o faturamento total por pedido para ordens finalizadas?
Objetivo: Calcular o faturamento total por pedido para ordens finalizadas.
1. Realiza o JOIN entre as tabelas de pedidos (sales_tb_orders) e itens (sales_tb_order_items) via order_id.
2. Filtra apenas pedidos com status '4' (Finalizados).
3. Agrupa os resultados por ID do pedido e soma os preços de lista dos itens.
4. Ordena o resultado de forma crescente pelo ID do pedido.
*/

SELECT
    ord.order_id,
    SUM(order_items.order_item_list_price * order_items.order_item_quantity) AS total_price
FROM sales_tb_orders ord
JOIN sales_tb_order_items order_items
    ON ord.order_id = order_items.order_id
WHERE ord.order_status = 4
GROUP BY ord.order_id
ORDER BY ord.order_id ASC;