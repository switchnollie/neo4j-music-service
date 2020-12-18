MATCH (s:Song)<-[rel:SINGS]-(ar:Artist)
RETURN s.name as Song, collect(DISTINCT ar.name) AS Artists, rel.role = 'Main Artist' AS IsMainArtist;