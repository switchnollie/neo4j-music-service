MATCH (ar:Artist)-[:SINGS {role: 'Featured Artist'}]->(s:Song)
WITH count(s) AS numFeatures, ar, collect(s.name) AS songs
RETURN ar.name AS artist, max(numFeatures) AS maxNoFeatures, songs;