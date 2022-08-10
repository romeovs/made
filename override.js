const path = require("path");
const fs = require("fs").promises;

const base = ".";

async function main() {
  const files = ["next.config.js", "next.config.mjs", "next.config.ts"];

  for (const file of files) {
    try {
      await override(file);
      return;
    } catch (err) {
      continue;
    }
  }
}

async function override(file) {
  const content = await fs.readFile(path.resolve(base, file), "utf-8");
  const m = content.match(/publicRuntimeConfig\s*:\s*\{\s*[^}]*\s*\}/gm);

  const dest = path.resolve(base, ".next/standalone/server.js");

  const server = await fs.readFile(dest, "utf-8");

  console.log(m[0]);
  console.log(server);

  const fixed = server.replace(/"publicRuntimeConfig":\{[^}]*\}/, m[0]);

  await fs.writeFile(dest, fixed);
}

main();
