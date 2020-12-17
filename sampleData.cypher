// Manual Cypher Commands to create the desired nodes and relationships

// CREATE
// (:Artist {name: 'Jimi Hendrix'})
// (:Artist {name: 'Eric Clapton'})
// (:Artist {name: 'John Mayer'})
// // Hendrix
// (:Album {name: 'Are You Experienced', released: 1967})
// (:Album {name: 'Electric Ladyland', released: 1968})
// // Clapton
// (:Album {name: 'Behind The Sun', released: 1985})
// (:Album {name: 'The Breeze', released: 2004})
// // Mayer
// (:Album {name: 'Continuum', released: 2006})
// // Hendrix
// (:Song:Single {name: 'Purple Haze'})
// // Clapton The Breeze (feat John Mayer)
// (:Song {name: 'Lies'})
// // Hendrix Are You Experienced
// (:Song {name: 'Foxy Lady'})
// (:Song {name: 'Manic Depression'})
// // Hendrix Electric Ladyland
// (:Song {name: 'Voodoo Chile'})
// (:Song {name: 'All Along the Watchtower'})
// // Clapton Behind The Sun
// (:Song {name: "She's Waiting"})
// // Clapton The Breeze
// (:Song {name: "Call Me The Breeze"})
// // Mayer Continuum
// (:Song {name: "Gravity"})
// (:Song {name: "Slow Dancing In A Burning Room"})


MATCH (al:Album)
WHERE al.name = 'Are You Experienced' AND al.released = 1967
CREATE (ar:Artist)-[:PUBLISHED]->(al)
SET ar.name = 'Jimi Hendrix'
RETURN ar,al

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'Jimi Hendrix' AND al.name = 'Electric Ladyland' AND al.released = 1968
CREATE (ar)-[:PUBLISHED]->(al)
RETURN ar,al

MATCH (al:Album)
WHERE al.name = 'Behind The Sun' AND al.released = 1985
CREATE (ar:Artist)-[:PUBLISHED]->(al)
SET ar.name = 'Eric Clapton'
RETURN ar,al

MATCH (ar:Artist), (al:Album)
WHERE ar.name = 'Eric Clapton' AND al.name = 'The Breeze' AND al.released = 2004
CREATE (ar)-[:PUBLISHED]->(al)
RETURN ar,al

MATCH (al:Album)
WHERE al.name = 'Continuum' AND al.released = 2006
CREATE (ar:Artist)-[:PUBLISHED]->(al)
SET ar.name = 'John Mayer'
RETURN ar,al
