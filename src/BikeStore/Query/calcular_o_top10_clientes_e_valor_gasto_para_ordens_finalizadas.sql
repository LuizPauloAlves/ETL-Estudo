/*
-- Qual o faturamento total do top 10 Clientes com ordens finalizadas?
Objetivo: Calcular o top 10 Clientes com o faturamento total das ordens finalizadas.
1. Realiza o JOIN entre as tabelas de pedidos (sales_tb_orders) e itens (sales_tb_order_items) via order_id.
2. Filtra apenas pedidos com status '4' (Finalizados).
3. Agrupa os resultados por ID do pedido e soma os preços vezes quantidades de lista dos itens.
4. Ordena o resultado de forma crescente pelos clientes_id e mostra o top 10.
*/

SELECT * FROM (
    SELECT sto.customer_id, 
           SUM(stoi.order_item_list_price * stoi.ORDER_ITEM_QUANTITY) AS gasto_total
    FROM sales_tb_orders sto
    JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
    WHERE sto.order_status = 4
    GROUP BY sto.customer_id
    ORDER BY gasto_total DESC
) 
WHERE ROWNUM <= 10;

/*
SELECT sto.customer_id, 
       SUM(stoi.order_item_list_price * stoi.order_item_quantity) AS gasto_total
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
WHERE sto.order_status = 4
GROUP BY sto.customer_id
ORDER BY gasto_total DESC
FETCH FIRST 10 ROWS ONLY;
*/