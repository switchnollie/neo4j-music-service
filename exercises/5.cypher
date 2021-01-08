MATCH (ar:Artist)-[:SINGS]->(s:Song)
WITH s, collect(ar.name) AS artistNames
WHERE size(artistNames) > 1
RETURN s.name, artistNames