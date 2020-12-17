import { readFileSync } from "fs";

export default function loadCypher(cypherFilePath) {
  return readFileSync(cypherFilePath)
    .toString()
    .split("\n")
    .filter((line) => !line.startsWith("//") && line.trim() !== "")
    .join(" ")
    .split(";")
    .filter((expr) => expr)
    .map((expr) => expr.trim());
}
