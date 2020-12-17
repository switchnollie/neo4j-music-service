MATCH (ar:Artist {name: 'John Mayer'})-[:SINGS {role: 'Main Artist'}]->(s:Song)
RETURN count(s);