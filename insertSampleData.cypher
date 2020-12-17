// Manual Cypher Commands to create the desired nodes and relationships
// Please use a semicolon after each query to ensure correct parsing
CREATE
(:Artist {name: 'Jimi Hendrix'}),
(:Artist {name: 'Eric Clapton'}),
(:Artist {name: 'John Mayer'});

MATCH (ar:Artist)
WHERE ar.name = 'Jimi Hendrix'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'Are You Experienced', al.released = 1967;

MATCH (ar:Artist)
WHERE ar.name = 'Jimi Hendrix'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'Electric Ladyland', al.released = 1968;

MATCH (ar:Artist)
WHERE ar.name = 'Jimi Hendrix'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'Axis: Bold as Love', al.released = 1967;

MATCH (ar:Artist)
WHERE ar.name = 'Eric Clapton'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'Behind The Sun', al.released = 1985;

MATCH (ar:Artist)
WHERE ar.name = 'Eric Clapton'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'The Breeze', al.released = 2004;

MATCH (ar:Artist)
WHERE ar.name = 'John Mayer'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'Continuum', al.released = 2006;

MATCH (ar:Artist)
WHERE ar.name = 'John Mayer'
CREATE (al:Album)<-[:PUBLISHED]-(ar)
SET al.name = 'The Search for Everything', al.released = 2017;

MATCH (al:Album), (ar:Artist)
WHERE al.name = 'Are You Experienced' AND ar.name = 'Jimi Hendrix'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Foxy Lady', rel.role = 'Main Artist';

MATCH (al:Album), (ar:Artist)
WHERE al.name = 'Are You Experienced' AND ar.name = 'Jimi Hendrix'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Manic Depression', rel.role = 'Main Artist';

MATCH (al:Album), (ar:Artist)
WHERE al.name = 'Electric Ladyland' AND ar.name = 'Jimi Hendrix'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Voodoo Chile', rel.role = 'Main Artist';

MATCH (al:Album), (ar:Artist)
WHERE al.name = 'Electric Ladyland' AND ar.name = 'Jimi Hendrix'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'All Along the Watchtower', rel.role = 'Main Artist';

MATCH (ar:Artist)
WHERE ar.name = 'Jimi Hendrix'
CREATE (ar)-[rel:Sings]->(s:Song:Single)
SET s.name = 'Purple Haze', rel.role = 'Main Artist';

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'Jimi Hendrix' AND al.name = 'Axis: Bold as Love'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Bold As Love', rel.role = 'Main Artist';

MATCH (al:Album), (ar:Artist)
WHERE al.name = 'The Breeze' AND ar.name = 'Eric Clapton'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Lies', rel.role = 'Main Artist';

MATCH (ar:Artist), (s:Song)
WHERE ar.name = 'John Mayer' AND s.name = 'Lies'
CREATE (ar)-[:Sings {role: 'Featured Artist'}]->(s);

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'Eric Clapton' AND al.name = 'The Breeze'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = 'Call Me The Breeze', rel.role = 'Main Artist';

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'Eric Clapton' AND al.name = 'Behind The Sun'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = "She's Waiting", rel.role = 'Main Artist';

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'John Mayer' AND al.name = 'Continuum'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = "Gravity", rel.role = 'Main Artist';

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'John Mayer' AND al.name = 'Continuum'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = "Bold As Love", rel.role = 'Main Artist';

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'John Mayer' AND al.name = 'Continuum'
CREATE (ar)-[rel:Sings]->(s:Song)-[:RELEASED_ON]->(al)
SET s.name = "Slow Dancing In A Burning Room", rel.role = 'Main Artist';

// Return newly created nodes and relationships
MATCH (a:Artist)-[rel:Sings]-(s)-[rel2:RELEASED_ON]-(al:Album), (a1:Artist)-[rel1:Sings]-(s1:Single:Song)
RETURN a, rel, s, rel2, al, a1, rel1, s1