/*
-- Top 10 Itens Mais Vendidos (Volume)
-- Identificar os 10 produtos com a maior quantidade total de unidades vendidas em pedidos finalizados.
1º - Relacionamento de Tabelas: JOIN entre sales_tb_order_items e sales_tb_orders via order_id
2º - Filtro de Qualidade: Filtra apenas pedidos com order_status = 4 (Finalizados)
3º - Agrupamento por Produto: Agrupa por product_id
4º - Soma de Volume: SUM(order_item_quantity) para cada produto
5º - Ordenação e Ranking: Ordena decrescente e limita aos Top 10
*/
SELECT stoi.product_id, 
       SUM(stoi.order_item_quantity) AS total_quantidade,
       SUM(stoi.order_item_list_price * stoi.order_item_quantity) AS total_valor
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
WHERE sto.order_status = 4
GROUP BY stoi.product_id
ORDER BY total_quantidade DESC
FETCH FIRST 10 ROWS ONLY;