CREATE (singlesAlbum:Album {name: 'Single Compilation', released: 2020});

MATCH (s:Single), (al:Album {name: 'Single Compilation'})
WHERE NOT (s)-[:RELEASED_ON]->()
CREATE (al)<-[rel:RELEASED_ON]-(s)
RETURN al, rel, s;