MATCH (ar:Artist)--(s:Song) 
WHERE NOT (s)-[:RELEASED_ON]->(:Album) 
RETURN ar.name;