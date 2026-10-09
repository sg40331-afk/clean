import fs from "node:fs";
import path from "node:path";

const root = process.cwd();
const out = path.join(root, "dist");
const skip = new Set([".git", "dist", "node_modules", "docs", "supabase", "scripts", ".env", ".env.local", ".env.example"]);

function copyDir(from, to) {
  fs.mkdirSync(to, { recursive: true });

  for (const entry of fs.readdirSync(from, { withFileTypes: true })) {
    if (skip.has(entry.name)) continue;

    const src = path.join(from, entry.name);
    const dest = path.join(to, entry.name);

    if (entry.isDirectory()) {
      copyDir(src, dest);
    } else if (entry.isFile()) {
      fs.copyFileSync(src, dest);
    }
  }
}

fs.rmSync(out, { recursive: true, force: true });
copyDir(root, out);
console.log("Built static site to dist");
