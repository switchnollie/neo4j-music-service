// MATCH (ar:Artist)-[:SINGS]->(s:Song)
// WITH s, collect(ar.name) AS artistNames
// WHERE size(artistNames) > 1
// RETURN s.name, artistNames

MATCH (ar1:Artist)-[:SINGS {role: "Main Artist"}]-(s:Song)-[:SINGS {role: "Featured Artist"}]-(ar2:Artist)
RETURN s.name AS song, ar1.name AS mainArtist, collect(ar2.name) AS featuredArtists;