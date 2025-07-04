-- Deltas Query
/*WITH maus AS (
SELECT 
DATW_TRUNC('month', order_date) :: DATE AS foodr_month,
COUNT(DISTINCT user_id) AS mau
FROM orders
GROUP BY foodr_month)
maus_lag AS(
SELECT 
foodr_month,
mau,
COALESCE(
LAG(mau) OVER( ORDER BY foodr_month ASC),
1) AS last_mau
FROM maus)
SELECT 
foodr_month,
mau,
mau-last_mau AS mau_delta
FROM maus_lag
ORDER BY foodr_month
limit 3;*/

WITH maus AS ( 
  SELECT 
    DATE_TRUNC('month', order_date) :: DATE AS foodr_month, 
    COUNT(DISTINCT user_id) AS mau 
  FROM orders 
  GROUP BY foodr_month),  
  maus_lag AS ( 
  SELECT 
    foodr_month, 
    mau, 
    COALESCE( 
      LAG(mau) OVER (ORDER BY foodr_month ASC), 
    1) AS last_mau 
  FROM maus) 
SELECT 
  foodr_month, 
  mau, 
  mau - last_mau AS mau_delta 
FROM maus_lag 
ORDER BY foodr_month 
LIMIT 3;

