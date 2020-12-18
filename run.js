#!/usr/bin/env node
import neo4j from "neo4j-driver";
import loadCypher from "./loadCypher.js";
import { runReadQueries } from "./runCypherQueries.js";

const [
  ,
  ,
  $1,
  $2 = "neo4j://localhost:7687",
  $3 = "neo4j",
  $4 = "1234",
] = process.argv;

const driver = neo4j.driver($2, neo4j.auth.basic($3, $4));

const session = driver.session();

async function main() {
  try {
    const serverInfo = await driver.verifyConnectivity();
    console.log(serverInfo);
    const cypherExerciseQueries = loadCypher(`./exercises/${$1}.cypher`);
    const results = await runReadQueries(session, cypherExerciseQueries);

    results.forEach((result) => {
      if (result.records && Array.isArray(result.records)) {
        result.records.forEach((r) =>
          console.log(JSON.stringify(r, undefined, 2))
        );
      }
    });
  } catch (err) {
    console.error(err);
  } finally {
    await session.close();
  }
  await driver.close();
}

main();
