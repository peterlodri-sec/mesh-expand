---
name: mesh-expand
description: >
  Expand a sovereign mesh + fleet — the 20-question brainstorm scaffold for
  adding nodes, hardening weak links, and growing an agent constellation
  (NATS, Tailscale, NixOS, worker nodes). Use when the user wants to add a
  node, scale the fleet, plan capacity, find weak points, or brainstorm
  "expand mesh" / "sovereign fleet" / "more nodes".
license: MIT
compatibility: Any coding agent (opencode, Claude Code, Crush, CodeWhale, entheai, Cursor, Copilot, Codex, Gemini CLI)
metadata:
  version: "1.0.0"
  author: peterlodri-sec
  domain: infrastructure
---

# mesh-expand

Scaffold the expansion of a sovereign mesh + fleet. Turns "let's add more
nodes / grow the mesh" into a measured plan instead of a vague wish.

## When to use

- The user wants to add a node (GPU, host, worker, satellite) to the mesh.
- The user asks "how do we expand / spread / scale the fleet".
- The user wants to find the weak link, single point of failure, or
  under-utilised host.
- Any "sovereign fleet" brainstorm that should end in one actionable item.

## Workflow — the 20-question gate

Run these questions against the CURRENT infrastructure (read the actual
configs: nix flakes, NATS config, Tailscale state, worker manifests — do not
guess from memory). Ask the user each question only if the answer is not
already visible in the repo.

1. mesh — where does the mesh end (furthest / most isolated node)?
2. fleet — which host is under-utilised right now?
3. mesh — what is the single weakest link (one node whose death costs most)?
4. fleet — if one new machine appeared today, where would it go, what runs?
5. people — who would run a node if it were a 5-minute install? what stops them?
6. mesh — what data travels through a third party that the mesh could carry?
7. fleet — what is the cost ceiling before it stops being "sovereign"?
8. mesh — which protocol (NATS/Tailscale/Nix/git/sops) is most fragile?
9. people — what does "sovereign" mean to each person (privacy/control/cost)?
10. fleet — what workload begs to run on the idle GPU we haven't dispatched?
11. mesh — if the internet vanished for a week, which parts still function?
12. fleet — cheapest sovereign GPU to buy vs rent today; break-even?
13. mesh — which service is a single point of failure to replicate?
14. people — what would make a friend WANT to host a node (belonging, not money)?
15. fleet — the next capacity number to measure (nodes/TFLOPs/uptime/latency)?
16. mesh — where is the constellation most visible vs invisible but working?
17. fleet — what would you deploy to a node in 60s with a one-click installer?
18. people — the one story that makes the fleet meaningful to outsiders?
19. mesh — the most surprising thing the mesh did that you didn't plan?
20. fleet — if only ONE item survived this brainstorm, which answer should it be?

## Output

Deliver a markdown plan with:

- **Measured state**: node table (host, role, CPU/GPU, network, utilisation),
  drawn from real configs — never invented.
- **Answers**: the user's answers to any open questions, tagged `[mesh]`,
  `[fleet]`, `[people]`.
- **The plan**: 3–5 ordered actions, each with (what / why / how / verify).
- **One actionable item**: the single highest-leverage next step, marked
  `→ DO THIS FIRST`.

## Scripts

- `scripts/plan.sh` — prints a template for the node table + action plan.
- `scripts/measure.sh` — best-effort local mesh measurement (NATS, Tailscale,
  process CPU) when run on a host inside the mesh.

## Rules

- Read real configs before answering; never fabricate node state.
- Keep answers honest: mark "unknown" explicitly, never guess a number.
- One actionable item is worth more than twenty vague ones.
- Respect the project's secrets rules — never echo tokens or keys.

## References

- `references/REFERENCE.md` — fleet glossary + capacity numbers
- `references/CF-TOKEN-ELI5.md` — the "mint a DNS token" visual guide
  (super-ELI5: the two CF token types, the phonebook metaphor, the
  click-by-click "Edit zone DNS" template). Use it whenever a fleet step
  is blocked on a Cloudflare DNS permission.
