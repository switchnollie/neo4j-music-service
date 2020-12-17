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

// Return newly created nodes and relationships
MATCH (ar:Artist)-[rel]-(al:Album) RETURN ar, al, rel