export default function batchRunCypherQueries(neo4jSession, queries) {
  return neo4jSession.writeTransaction((tx) => {
    return queries.reduce(
      (p, query) => p.then((_) => tx.run(query)),
      Promise.resolve()
    );
  });
}
