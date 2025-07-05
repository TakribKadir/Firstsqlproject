--Average Revenue Per User By Month
WITH kpis AS (
  SELECT 
    DATE_TRUNC('month', order_date) AS delivr_month,
    SUM(meal_price * order_quantity) AS revenue,
    COUNT(DISTINCT user_id) AS users
  FROM meals m
  JOIN orders o ON m.meal_id = o.meal_id
  GROUP BY delivr_month
)
SELECT 
  delivr_month,
  ROUND(
    revenue :: NUMERIC / GREATEST(users, 1),
  2) AS arpu
FROM kpis
ORDER BY delivr_month ASC;
