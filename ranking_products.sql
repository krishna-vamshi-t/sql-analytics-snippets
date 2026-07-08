SELECT
    category,
    product_name,
    SUM(sales) AS total_sales,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM orders
GROUP BY category, product_name;
