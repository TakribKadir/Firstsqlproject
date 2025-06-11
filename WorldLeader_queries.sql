Select * From monarchs;
SELECT prime_ministers.country, prime_ministers.continent,
prime_ministers, president
FROM presidents
INNER JOIN prime_ministers
ON presidents.country = prime_ministers.country;