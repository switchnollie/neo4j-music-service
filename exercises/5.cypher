MATCH (ar:Artist)-[:SINGS]->(s:Song)
WITH count(ar) as numArtists, s
WHERE numArtists > 1
RETURN s