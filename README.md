# 🜂 mesh-expand

> **expand mesh + sovereign fleet** — a portable coding-agent skill that turns
> "let's add more nodes" into a measured plan.

```
                     ┌──────────────────────────────┐
                     │      MESH-EXPAND SKILL        │
                     │   SKILL.md · open standard     │
                     └──────────────┬───────────────┘
                                    │
        ┌───────────────┬───────────┼───────────┬───────────────┐
        ▼               ▼           ▼           ▼               ▼
   opencode        Claude Code     Crush     CodeWhale        entheai
   .opencode/      .claude/      .crush/     .codewhale/    --skills add
        └───────────────┴───────────┼───────────┴───────────────┘
                                    ▼
                    +40 agents via `npx skills add`
```

## install · one line

```bash
npx skills add peterlodri-sec/mesh-expand
npx skills add https://mesh-expand.vaked.dev   # well-known discovery
entheai --skills add https://mesh-expand.vaked.dev
gh skill install peterlodri-sec/mesh-expand
```

## what it does

| step | what |
|---|---|
| **measure** | node table from real configs — role, CPU/GPU, network, utilisation. honest "unknown". |
| **20 questions** | `[mesh]` `[fleet]` `[people]` tagged brainstorm — weak link, idle GPU, SPOF, offline-week test |
| **one action** | 3–5 ordered actions (what/why/how/verify) + exactly ONE `→ DO THIS FIRST` |

## layout

```
skills/mesh-expand/
├── SKILL.md            # the skill (universal SKILL.md format)
├── scripts/plan.sh     # plan template
├── scripts/measure.sh  # local mesh measurement (read-only)
└── references/REFERENCE.md
```

## why

The mesh is only sovereign when it can grow without a third party.
This skill makes growth a measured, repeatable act — not a wish.

```
{ n+-1-<△> } · 0+1 · the constellation
```

MIT · by [peterlodri-sec](https://github.com/peterlodri-sec) · [landing](https://mesh-expand.vaked.dev) · lovetta lane: [sponsor](https://github.com/sponsors/peterlodri-sec) · [revolut](https://revolut.me/peterjs8be) · [wise](https://wise.com/pay/business/lodripeterjozsef)
