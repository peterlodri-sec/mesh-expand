# mesh-expand — documentation

## What this is

A portable coding-agent **skill** (`SKILL.md`, open agent-skills standard)
that scaffolds expanding a sovereign mesh + fleet. Installable in 40+
agents via `npx skills add`, or natively in opencode, Claude Code, Crush,
CodeWhale, entheai, Cursor, Copilot, Codex, Gemini CLI.

## Install

```bash
# any agent, from GitHub
npx skills add peterlodri-sec/mesh-expand

# any agent, from the landing's .well-known discovery
npx skills add https://mesh-expand.vaked.dev

# entheai native
entheai --skills add https://mesh-expand.vaked.dev

# GitHub CLI
gh skill install peterlodri-sec/mesh-expand
```

## Using the skill

1. Point the agent at the mesh you want to expand (repo or workspace).
2. Invoke the skill (`/mesh-expand`, `@mesh-expand`, or "expand the mesh").
3. The agent reads real configs (nix flakes, NATS, Tailscale, worker
   manifests) and runs the 20-question gate.
4. Output: node table + tagged answers + 3–5 ordered actions + ONE
   `→ DO THIS FIRST`.

## The 20 questions

Tagged `[mesh]` (topology), `[fleet]` (hardware/cost), `[people]`
(adoption/meaning). Highlights: the weak link, the idle GPU, the
single point of failure, the "if the internet vanished" test, and the
final "which ONE item survives" question.

## Compatibility notes

- `name` in frontmatter MUST equal the folder name (`mesh-expand`).
- Frontmatter sticks to portable fields: `name`, `description`, `license`,
  `compatibility`, `metadata`. No per-agent extensions.
- The repo ships the skill in `skills/mesh-expand/`, plus symlinked
  mirrors in `.agents/skills/` and `.claude/skills/` so native readers
  pick it up without install.
- `.well-known/agent-skills/index.json` serves the discovery manifest for
  URL-based installs.

## Layout

```
mesh-expand/
├── skills/mesh-expand/
│   ├── SKILL.md
│   ├── scripts/plan.sh
│   ├── scripts/measure.sh
│   └── references/REFERENCE.md
├── .agents/skills/mesh-expand -> skills/mesh-expand
├── .claude/skills/mesh-expand  -> skills/mesh-expand
├── .well-known/agent-skills/index.json
├── public/index.html           # landing page
└── docs/                       # this doc
```

## License

MIT
