MATCH (ar:Artist {name: 'John Mayer'})-[:Sings {role: 'Main Artist'}]->(s:Song)
RETURN count(s);