/*SELECT
	DATE_TRUNC('month', ORDER_DATE)::DATE AS DELIVR_MONTH 
	COUNT(DISTINCT USER_ID) AS MAU
FROM
	ORDERS
GROUP BY
	DELIVR_MONTH
ORDER BY
	DELIVR_MONTH ASC
LIMIT
	3; */
SELECT 
  DATE_TRUNC('month', ORDER_DATE)::DATE AS foodr_MONTH,
  COUNT(DISTINCT USER_ID) AS MAU
FROM 
  ORDERS
GROUP BY 
  --DATE_TRUNC('month', ORDER_DATE)::DATE
  foodr_MONTH
ORDER BY 
  foodr_MONTH ASC
LIMIT 3;
