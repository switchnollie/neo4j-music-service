#!/usr/bin/env node
import neo4j from "neo4j-driver";
import loadCypher from "./loadCypher.js";
import { batchRunCypherWriteQueries } from "./runCypherQueries.js";

const [
  ,
  ,
  $1 = "neo4j://localhost:7687",
  $2 = "neo4j",
  $3 = "1234",
] = process.argv;

const driver = neo4j.driver($1, neo4j.auth.basic($2, $3));

const session = driver.session();

async function resetDb() {
  // Delete all Nodes that have relationships and their relationships
  await session.run(`MATCH (a) -[r] -> () DELETE a, r`);
  // Delete all Nodes that don't have relationships
  await session.run(`MATCH (a) DELETE a`);
}

async function main() {
  try {
    const serverInfo = await driver.verifyConnectivity();
    console.log(serverInfo);
    await resetDb();
    const cypherSeedingQueries = loadCypher("./insertSampleData.cypher");
    console.log("---Executed queries---");
    console.log(cypherSeedingQueries);
    console.log("------");
    await batchRunCypherWriteQueries(session, cypherSeedingQueries);
  } catch (err) {
    console.error(err);
  } finally {
    await session.close();
  }
  await driver.close();
}

main();
