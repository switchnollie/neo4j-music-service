MATCH (a:Album)
WHERE a.released IN [2017, 2020]
RETURN a;