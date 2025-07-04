--Using Common table Expressions (CTEs)
WITH
	COSTS_AND_QUANTITIES AS (
		SELECT
			MEALS.MEAL_ID,
			SUM(STOCKED_QUANTITY) AS QUANTITY,
			SUM(MEAL_COST * STOCKED_QUANTITY) AS COST
		FROM
			MEALS
			JOIN STOCK ON MEALS.MEAL_ID = STOCK.MEAL_ID
		GROUP BY
			MEALS.MEAL_ID
	)
SELECT
	MEAL_ID,
	QUANTITY,
	COST
FROM
	COSTS_AND_QUANTITIES
ORDER BY
	COST DESC
LIMIT
	3;