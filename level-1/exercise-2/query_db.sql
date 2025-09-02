USE pizzeria;

-- should be 2
SELECT SUM(quantity)
FROM product_orders po
JOIN products p ON po.product_id = p.id
JOIN orders o ON po.order_id = o.id
JOIN stores s ON o.store_id = s.id
WHERE p.type = 'drink'
	AND s.municipality = 1;