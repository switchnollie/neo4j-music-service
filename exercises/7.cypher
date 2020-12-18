MATCH (ar:Artist)
OPTIONAL MATCH (ar)-[:SINGS {role: 'Featured Artist'}]->(s:Song)
OPTIONAL MATCH (s)-[:RELEASED_ON]->(al:Album)
WITH ar.name AS artist, collect(DISTINCT al.name) AS featuredAlbums
RETURN artist, size(featuredAlbums) AS numFeaturedAlbums, featuredAlbums;