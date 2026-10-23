# Teable MCP

Claude Code, Codex and ChatGPT plugin for Teable's hosted MCP server. This repository
holds the plugin manifests and setup docs; the server itself ships with Teable.

Connect AI assistants to [Teable](https://teable.ai), the AI spreadsheet for business. Once
installed, Claude, Codex and ChatGPT can find your projects and tables, read field
definitions, query records, run read-only SQL, and create, update or delete records,
always as you and within the permissions you approve.

The plugin points at Teable's hosted MCP server, `https://mcp.teable.ai/mcp`
(Streamable HTTP, OAuth 2.1). There is nothing to run locally and no API key to paste:
the first time a tool is used, your client opens Teable's sign-in and consent page.

## Install

### Claude Code

```bash
claude plugin marketplace add teableio/teable-mcp
claude plugin install teable@teable
```

Or, without the plugin: `claude mcp add --transport http teable https://mcp.teable.ai/mcp`.
Then run `/mcp` and choose **Authenticate**.

### Codex

```bash
codex plugin marketplace add teableio/teable-mcp
codex plugin add teable@teable
codex mcp login teable
```

Or add the server directly to `~/.codex/config.toml`:

```toml
[mcp_servers.teable]
url = "https://mcp.teable.ai/mcp"
```

### Cursor, VS Code and other MCP clients

```json
{
  "mcpServers": {
    "teable": { "url": "https://mcp.teable.ai/mcp" }
  }
}
```

Clients without a browser (CI, scripts) can send a personal access token instead:
create one in Teable under **Settings → Personal access tokens** and pass it as
`Authorization: Bearer <token>`.

Teable also lists every option, with copyable snippets, under **Settings → MCP**.

## Tools

| Tool | What it does | Changes data |
| --- | --- | --- |
| `list-bases` | List the projects (bases) you can access | No |
| `get-tables-meta` | List the tables in a project | No |
| `get-fields` | Field definitions of a table | No |
| `get-records` | Query records with filters, sorting and projections | No |
| `sql-query` | Run a read-only SQL `SELECT` across a project's tables | No |
| `get-doc` | Teable reference docs: filter, formula, link-field formats | No |
| `search-api` | Find an endpoint in the [Teable REST API](https://help.teable.ai/en/api-doc/overview) | No |
| `call-api-read` | Call a `GET` endpoint of the Teable API | No |
| `create-records` | Create records | Yes |
| `update-records` | Update records | Yes |
| `delete-records` | Delete records | Yes (destructive) |
| `call-api-write` | Call a `POST`/`PUT`/`PATCH`/`DELETE` endpoint of the Teable API | Yes (destructive) |

Tools that change data are annotated as such, so your client asks for confirmation
before running them. Which tools appear depends on the permissions you grant: a
read-only grant hides every tool that writes.

## Example prompts

- "List my Teable projects and the tables in each one."
- "How many deals are in each stage in my CRM project?"
- "Add a task called 'Prepare launch checklist' to my Project Tracker."

## Self-hosted Teable

The same server ships with every Teable deployment at `<your Teable URL>/mcp`. Point
any client above at that URL instead of `mcp.teable.ai`.

## Privacy, terms and support

- Privacy: <https://teable.ai/mcp-terms#privacy>
- Terms: <https://teable.ai/mcp-terms#terms>
- Support: [open an issue](https://github.com/teableio/teable-mcp/issues) or email
  [support@teable.ai](mailto:support@teable.ai)

## Repository layout

```
.claude-plugin/marketplace.json     Claude Code marketplace
.agents/plugins/marketplace.json    Codex marketplace
plugins/teable/
  .claude-plugin/plugin.json        Claude plugin manifest
  .codex-plugin/plugin.json         Codex / OpenAI manifest, with listing and review metadata
  .mcp.json                         The server, shared by both clients
  assets/                           Logo and composer icon
scripts/package-openai.sh           Builds the ZIP uploaded to the OpenAI plugin portal
```

The MCP server itself lives in the Teable codebase; this repository only describes how
clients reach it.
