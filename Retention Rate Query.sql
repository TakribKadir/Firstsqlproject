--Retention Rate Query
/*WITH user_activity AS(
SELECT DISTINCT
DATE_TRUNC('month', order_date)::DATE AS foodr_month,
uder_id
FROM orders
)
SELECT 
previous.foodr_month,
ROUND(
COUNT(DISTINCT current.user_id):: NUMERIC/GREATEST(COUNT(DISTINCT previous.user_id),1),
2) AS retention
FROM user_activity AS previous
LEFT JOIN user_activity AS current
ON previous.user_id=current.user_id
AND previous.foodr_month=(current.foodr_month -INTERVAL '1 month'),
GROUP BY previous.foodr_month 
ORDER BY previous.foodr_month ASC
LIMIT 3;*/
WITH user_activity AS ( 
  SELECT DISTINCT 
    DATE_TRUNC('month', order_date) :: DATE AS foodr_month, 
    user_id 
  FROM orders)  
SELECT 
  previous.foodr_month, 
  ROUND( 
    COUNT(DISTINCT current.user_id) :: NUMERIC / 
    GREATEST(COUNT(DISTINCT previous.user_id), 1), 
  2) AS retention  
FROM user_activity AS previous 
LEFT JOIN user_activity AS current 
ON previous.user_id = current.user_id 
AND previous.foodr_month = (current.foodr_month - INTERVAL '1 month') 
GROUP BY previous.foodr_month 
ORDER BY previous.foodr_month ASC 
LIMIT 3;

