export default function batchRunCypherQueries(neo4jSession, queries) {
  return neo4jSession.writeTransaction((tx) => {
    const queryPromises = queries.map((query) => tx.run(query));
    return Promise.all(queryPromises);
  });
}
