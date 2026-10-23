#!/usr/bin/env bash
# Builds the ZIP uploaded to https://platform.openai.com/plugins (ChatGPT and Codex).
#
# Locally, Claude Code and the Codex CLI share plugins/teable/.mcp.json, which needs
# "type": "http" (Claude drops a remote server without it). The OpenAI portal reads
# the Codex format without a transport type and takes OAuth settings from the server
# entry, so the archive gets a rewritten .mcp.json; the Claude manifest stays out.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
plugin="$root/plugins/teable"
version="$(node -p "require('$plugin/.codex-plugin/plugin.json').version")"
out="$root/dist/teable-$version.zip"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

cp -R "$plugin/.codex-plugin" "$plugin/assets" "$plugin/README.md" "$stage/"
node -e '
  const fs = require("fs");
  const [src, dest] = process.argv.slice(1);
  const { mcpServers } = JSON.parse(fs.readFileSync(src, "utf8"));
  for (const server of Object.values(mcpServers)) {
    delete server.type;
    server.extensions = { "com.openai": { auth: { type: "oauth", client: { mode: "dcr" } } } };
  }
  fs.writeFileSync(dest, JSON.stringify({ mcpServers }, null, 2) + "\n");
' "$plugin/.mcp.json" "$stage/.mcp.json"

mkdir -p "$root/dist"
rm -f "$out"
(cd "$stage" && zip -qr "$out" .codex-plugin .mcp.json assets README.md)
echo "$out"
