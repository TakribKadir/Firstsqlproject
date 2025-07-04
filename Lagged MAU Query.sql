--Lagged MAU - query
/*WITH
	MAUS AS (
		DATE_TRUNC('month', ORDER_DATE)::DATE AS FOODR_MONTH,
		COUNT(DISTINCT USER_ID) AS MAU
		FROM
			ORDERS
		GROUP BY
			FOODR_MONTH
	)
SELECT
	FOODR_MONTH,
	MAU,
	COALESCE(
		LAG(MAU) OVER (
			ORDER BY
				FOODR_MONTH ASC
		),
		1
	) AS LAST_MAU
FROM
	MAUS
ORDER BY
	FOODR_MONTH ASC
LIMIT
	3;*/

	WITH maus AS ( 
  SELECT 
    DATE_TRUNC('month', order_date) :: DATE AS foodr_month, 
    COUNT(DISTINCT user_id) AS mau 
  FROM orders 
  GROUP BY foodr_month)  
 SELECT 
  foodr_month, 
  mau, 
  COALESCE( 
    LAG(mau) OVER (ORDER BY foodr_month ASC), 
  1) AS last_mau 
FROM maus 
ORDER BY foodr_month ASC 
LIMIT 3;
