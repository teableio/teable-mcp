# Teable

Connects Claude, Codex and ChatGPT to your [Teable](https://teable.ai) account through
Teable's hosted MCP server (`https://mcp.teable.ai/mcp`). Your assistant can list your
projects and tables, read field definitions, query records, run read-only SQL, and
create, update or delete records, always with your own permissions. Sign-in happens in
the browser on first use; no API key is needed.

Install in Claude Code:

```bash
claude plugin marketplace add teableio/teable-plugin
claude plugin install teable@teable
```

Install in Codex:

```bash
codex plugin marketplace add teableio/teable-plugin
codex plugin add teable@teable
codex mcp login teable
```

Privacy: <https://teable.ai/mcp-terms#privacy> · Terms: <https://teable.ai/mcp-terms#terms>

See the [repository README](https://github.com/teableio/teable-plugin#readme) for every
client, the tool list and self-hosted setup.
