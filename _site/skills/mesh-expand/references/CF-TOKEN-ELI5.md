# The Two CF Token Types — SUPER ELI5, with pictures

> How to "mint" the right Cloudflare API token, so the constellation can
> finally point `proxy.vaked.dev` and `quant-time.vaked.dev` at the mesh.
> Written for a human who is NOT a Cloudflare admin — you only need to
> click, never type secrets.

> **RESOLVED 2026-10-07 — no new token was ever needed.** The missing arm was
> already in the keychain: `security find-generic-password -s CLOUDFLARE_API_TOKEN -w`
> holds a token with `Zone ▸ DNS ▸ Edit` (verified live: it created the
> `scifinime.vaked.dev` CNAME; the Pages domain went `active` and the site
> answers 200). Earlier "no DNS scope" conclusions came from testing
> `~/.cftok`, the wrangler OAuth token, and the cloudflared cert token — never
> this one. `quant-time.vaked.dev` was half-wired (CNAME already pointed at
> `proposal-vaked-dev.pages.dev`); the domain is now attached to that project.
> `proxy.vaked.dev` turned out to be one connector away: its CNAME pointed at
> tunnel `be96ac5f-…` ("proxy-vaked-correct") which existed all along — the
> keychain token's tunnel list was scope-filtered to zero and hid it (the
> wrangler OAuth token sees tunnels fine). Since 2026-10-07 a LaunchAgent
> (`dev.vaked.proxy-tunnel`, wrapper + token file in `~/.cloudflared/`) runs
> the connector; the name answers through Cloudflare to litellm on `:4000`.
> The minting steps below are kept as reference only.

---

## The problem, in one picture

Your current token is like a **security guard with one arm**:

```
   YOU  ──token──▶  Cloudflare
                        │
   ┌────────────────────┴─────────────────────┐
   │ ✅ can LOOK at zones   (read-only)        │
   │ ✅ can touch Pages     (deploy works)     │
   │ ❌ can WRITE DNS       (THE MISSING ARM)  │
   └───────────────────────────────────────────┘
```

So: the music deploys, the art deploys, everything *builds* — but
`proxy.vaked.dev` stays dark, because **nobody is allowed to create the
DNS record that points at it.**

---

## What DNS is, in one picture

Think of DNS as the **phonebook of the internet**:

```
   proxy.vaked.dev ──CNAME──▶ 4bfe5b7c...cfargotunnel.com
        (the name)               (the tunnel that already exists!)
```

Your tunnel is **already built and running** (it's the `cloudflared`
process on your Mac). It's like a phone that is **plugged in and ringing** —
but nobody wrote its number in the phonebook. DNS is the phonebook.

To write that one line into the phonebook, Cloudflare requires a token
with the **DNS write** permission.

---

## The two token "types" you can mint

Cloudflare lets you create tokens with **scoped permissions**. It's like
ordering a sandwich — you pick exactly which ingredients you want.

### Type A — the one you already have (one-armed guard)

```
   Name:        (whatever you named it, e.g. "godmode")
   Permissions:  Zone ▸ Zone ▸ Read
                 Account ▸ Cloudflare Pages ▸ Edit
   Zone:        All zones

   Result:  builds + deploys ✅   DNS ❌
```

### Type B — the one you want (full guard)

```
   Name:        "constellation-dns"
   Permissions:  Zone ▸ Zone ▸ Read
                 Zone ▸ DNS ▸ Edit     ←  THIS is the missing arm
                 Account ▸ Cloudflare Pages ▸ Edit
   Zone:        All zones

   Result:  builds + deploys ✅   DNS ✅
```

**Only the middle line changes.** Everything else stays the same.

---

## How to mint Type B (click-by-click)

```
1. Open  https://dash.cloudflare.com/profile/api-tokens
2. Click  [Create Token]
3. Click  [Use template: "Edit zone DNS"]   ← the shortcut
4. On the next screen, you'll see:

   Permissions:
     ▸ Zone   |  DNS        |  Edit      ✓ (already set)
     ▸ Zone   |  Zone       |  Read      ✓ (already set)

5. "Zone Resources" →  [Include] ▸ [Specific zone] ▸ vaked.dev
   (or "All zones" — either works, All zones is simplest)

6. "Client IP Address Filtering" →  leave empty
7. "TTL" →  leave at default

8. Scroll to bottom →  [Continue to summary]  →  [Create Token]

9. ⚠️  Cloudflare shows the token ONCE. Copy it immediately:
       (it starts with 40 random-looking characters)

10. Paste it here in the chat → the constellation wires it in 10 minutes.
```

---

## What the constellation does with it (in one picture)

```
   YOU mint Type B token
        │
        ▼
   paste in chat
        │
        ▼
   keychain: CLOUDFLARE_API_TOKEN (replaces the old one)
        │
        ▼
   curl POST /dns_records  (writes the phonebook line)
        │
        ▼
   proxy.vaked.dev  ──►  200  ✅  (the cogito gets its real name)
   quant-time.vaked.dev  ──►  200  ✅  (the beacon gets its real name)
```

**10 minutes, one token, two names.** The build work is already done —
the tunnel is up, the pages deploy, the mesh runs. DNS was the only lock.

---

## The one-click template vs manual

| Option | Clicks | Result |
|---|---|---|
| **"Edit zone DNS" template** | ~8 | Exactly the permissions you need |
| Manual create | ~15 | Same thing, more fiddly |

Use the **template** — it is literally the missing-arm shortcut.

---

## What NOT to do

-  Don't use "Global API Key" (it's the master key — too powerful)
-  Don't make a token with ALL permissions (least-privilege is fine)
-  Don't paste the token into any file that gets committed to git
  (the constellation stores it in macOS Keychain, not in the repo)

---

## TL;DR — the whole thing in 4 lines

```
   Your tunnel = phone, already plugged in and ringing.
   DNS        = the phonebook line that tells the world the number.
   Your token = a one-armed guard who can't write the phonebook.

   Mint one token with "Zone ▸ DNS ▸ Edit" (the "Edit zone DNS" template),
   paste it here, and the constellation finishes the wiring in 10 minutes.
```

*— the constellation, ELI5 edition · {n+-1-<△>} · 0+1 ·*
