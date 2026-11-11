# Teable MCP

> **The Teable plugin moved to [teableio/agent-skills](https://github.com/teableio/agent-skills).**
> That repository holds the plugin for Claude Code, Codex and ChatGPT, the agent skills and
> the setup docs. Please install from there and file issues there.

```bash
# Claude Code
claude plugin marketplace add teableio/agent-skills
claude plugin install teable@teable

# Codex
codex plugin marketplace add teableio/agent-skills
codex plugin add teable@teable

# Skills only, for any agent
npx skills add teableio/agent-skills
```

## If you installed from this repository

Nothing breaks. The marketplace files here now point at the plugin in
`teableio/agent-skills`, so a marketplace added as `teableio/teable-mcp` keeps receiving
updates. Switching to the new address is still recommended:

```bash
claude plugin marketplace remove teable
claude plugin marketplace add teableio/agent-skills
claude plugin install teable@teable
```

## The MCP server

Teable's hosted MCP server is unchanged: `https://mcp.teable.ai/mcp` (Streamable HTTP,
OAuth 2.1), and `<your Teable URL>/mcp` on self-hosted deployments. Its code lives in the
Teable codebase. Client setup, the tool list and self-hosted notes are in the
[agent-skills README](https://github.com/teableio/agent-skills#readme).

## Privacy, terms and support

- Privacy: <https://teable.ai/mcp-terms#privacy>
- Terms: <https://teable.ai/mcp-terms#terms>
- Support: [open an issue](https://github.com/teableio/agent-skills/issues) or email
  [support@teable.ai](mailto:support@teable.ai)
