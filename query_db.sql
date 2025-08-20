SELECT 
    c.first_name, 
    c.last_name, 
    COUNT(s.id) AS total_invoices
FROM sales s
JOIN customers c ON s.id_customer = c.id
WHERE c.id = 1
  AND s.date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY c.id;

SELECT 
    e.first_name, 
    e.last_name, 
    b.name AS brand, 
    g.frame_type, 
    g.frame_color, 
    g.lens_color
FROM sales s
JOIN employees e ON s.id_employee = e.id
JOIN glasses g ON s.id_glasses = g.id
JOIN brands b ON g.id_brand = b.id
WHERE e.id = 2
  AND YEAR(s.date) = 2025
GROUP BY g.id;

SELECT DISTINCT 
    p.name AS provider_name
FROM sales s
JOIN glasses g ON s.id_glasses = g.id
JOIN brands b ON g.id_brand = b.id
JOIN providers p ON b.id_provider = p.id;

