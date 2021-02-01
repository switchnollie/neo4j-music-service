MATCH (a:Album)
WHERE 2017 <= a.released <= 2020
RETURN a;