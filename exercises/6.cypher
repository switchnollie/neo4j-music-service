MATCH (ar:Artist)-[:SINGS {role: 'Featured Artist'}]->(s:Song)
WITH count(s) as numFeatures, ar, collect(s.name) as songs
RETURN ar.name, max(numFeatures), songs;