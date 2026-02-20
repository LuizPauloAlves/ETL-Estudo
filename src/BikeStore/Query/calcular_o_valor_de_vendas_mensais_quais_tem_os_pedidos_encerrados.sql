/*
-- Qual o faturamento mensal considerando apenas pedidos enviados?
-- Calcular o total vendido por mês com base na data de efetivação da entrega.
1º - JOIN e Filtro: Une as tabelas de pedidos (sales_tb_orders) e itens (sales_tb_order_items) pelo order_id. Filtra apenas pedidos que possuem data de envio (shipped_date) preenchida (não nula) e status finalizado.
2º - Cálculo de Receita: Calcula o faturamento real por item.
3º - Truncamento de Data: Extrai o mês e o ano da shipped_date para agrupar os valores cronologicamente.
4º - Agrupamento e Ordenação: Agrupa por mês e ordena o resultado do mais antigo para o mais recente.
*/

SELECT TO_CHAR(sto.order_shipped_date, 'MON/YYYY', 'NLS_DATE_LANGUAGE=PORTUGUESE') AS mes,
       SUM(stoi.order_item_list_price * stoi.order_item_quantity) AS fatura_mensal
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
WHERE sto.order_status = 4
GROUP BY TO_CHAR(sto.order_shipped_date, 'MON/YYYY', 'NLS_DATE_LANGUAGE=PORTUGUESE')
ORDER BY MIN(sto.order_shipped_date);

/*
SELECT TRUNC(sto.order_shipped_date, 'MONTH') AS mes,
       SUM(stoi.order_item_list_price * stoi.order_item_quantity) AS fatura_mensal
FROM sales_tb_orders sto
JOIN sales_tb_order_items stoi ON sto.order_id = stoi.order_id
WHERE sto.order_status = 4
GROUP BY TRUNC(sto.order_shipped_date, 'MONTH')
ORDER BY mes;
*/