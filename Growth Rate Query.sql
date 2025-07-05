--Growth Rate Query
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
  ROUND(
(mau-last_mau)::NUMERIC/last_mau,
 2) AS growth 
 FROM maus_lag
 ORDER BY foodr_month
 limit 3;
