export function batchRunCypherWriteQueries(neo4jSession, queries) {
  return neo4jSession.writeTransaction((tx) => {
    const queryPromises = queries.map((query) => tx.run(query));
    return Promise.all(queryPromises);
  });
}

export async function runReadQueries(neo4jSession, queries) {
  let results = [];
  await neo4jSession.readTransaction(async (txc) => {
    for (let query of queries) {
      results = [...results, await txc.run(query)];
    }
  });
  return results;
}
