/* 1 Retorne a quantidade de itens vendidos em
cada categoria de produto
(category_product_name) por estado.. Mostre
somente categorias/estados que tenha vendido
uma quantidade de itens acima de 1000 itens.
 */
select count (o.order_id) as contador, product_category_name, customer_state
from orders o
INNER JOIN customers c on c.customer_id = o.customer_id 
INNER JOIN order_items oi on o.order_id = oi.order_id 
INNER JOIN products p ON p.product_id = oi.product_id 
GROUP BY 2,3
HAVING contador > 1000

/*2 Mostre os 5 clientes (customer_id) que tem o maior valor total de compras (considerar apenas o valor do produto). 
 * Qual foi o valor total de todas as compras, a quantidade de compras, e o valor médio gasto por cada um deles?*/
/* order_items*/

SELECT orders.customer_id,
SUM(order_items.price) AS valor_total FROM orders 
INNER JOIN order_items ON orders.order_id = order_items.order_id 
GROUP BY orders.customer_id
ORDER BY valor_total DESC 
LIMIT 5;

--valor total (basta não agrupar por determinada coluna)
SELECT orders.customer_id,
SUM(order_items.price) AS valor_total FROM orders 
INNER JOIN order_items ON orders.order_id = order_items.order_id 
ORDER BY valor_total DESC; 

--media (AVG)
SELECT orders.customer_id,
AVG (order_items.price) AS valor_medio FROM orders 
INNER JOIN order_items ON orders.order_id = order_items.order_id 
GROUP BY orders.customer_id
ORDER BY valor_medio DESC 
LIMIT 5;

--quantidade de compras (COUNT) 
SELECT orders.customer_id,
COUNT (order_items.price) AS valor_quantidade_compras FROM orders 
INNER JOIN order_items ON orders.order_id = order_items.order_id 
GROUP BY orders.customer_id
ORDER BY valor_quantidade_compras DESC 
LIMIT 5;


/*3 Agora mostre os 5 clientes (customer_id) que tem a maior quantidade total de compras. 
 * Qual foi o valor total de todas as compras, a quantidade de compras, e o valor médio gasto por cada um deles?*/

SELECT orders.customer_id,
COUNT (orders.customer_id) AS quantidade_compras FROM orders 
INNER JOIN order_items ON orders.order_id = order_items.order_id 
GROUP BY orders.customer_id
ORDER BY quantidade_compras DESC 
LIMIT 5;

/*4 Mostre o valor vendido total de cada vendedor (seller_id) em cada uma das categorias de produtos, 
 somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000. 
 Desejamos ver a categoria do produto e os vendedores - 
 para cada uma dessas categorias mostre seus valores de venda de forma decrescente.*/


SELECT SUM (price) AS soma, product_category_name, seller_id FROM order_items oi 
INNER JOIN products p ON p.product_id = oi.product_id 
GROUP BY 2,3
having SOMA > 1000
ORDER BY 1 DESC 



