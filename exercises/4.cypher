MATCH (ar:Artist {name: 'John Mayer'})-[:SINGS {role: 'Main Artist'}]->(s:Song)
RETURN ar.name AS artist, count(s) AS noSongsAsMainArtist;