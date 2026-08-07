# expand mesh + sovereign fleet — the plan

_source: mesh-expand skill · brainstorm 2026-08-07 · peterlodri-sec_

---

## 1. measured state (real, not guessed)

| node | role | hw | status | notes |
|------|------|-----|--------|-------|
| vast GPU | worker (entheai-worker --serve) | RTX 3090 24GB | **running** | MLX CUDA él · NATS worker él |
| Mac (mbp) | **NATS hub** | M1 | running | hub a gépen = SPOF |
| dev-cx53 | build/deploy host | x86_64 | — | **a leggyengébb láncszem (Q3)** |
| hetzner | aarch64 fleet | CAX31 | — | lehetséges worker-node |
| public-services-host | public szolgáltatások | x86_64 | — | mastodon/forgejo |
| tailscale | 19 peer | — | alive | a mesh gerince |

**A mért kép két SPOF-ot mutat:** (1) a NATS hub a Macen él — ha a Mac alszik, a mesh meghal; (2) dev-cx53 a felhasználó szerint a leggyengébb láncszem.

---

## 2. answers (tagged)

- **[mesh] Q1** — expand FROM WITHIN: headscale (juanfont/headscale) a meglévő tailscale hálón belül → a mesh saját control plane-t kap, nem a Tailscale SaaS-t.
- **[fleet] Q3** — leggyengébb láncszem: **dev-cx53**.
- **[fleet] Q7** — költség-plafon: **~300 EUR/hó**.
- **[mesh] Q10** — a vast 3090 tehetetlen munkája: **quant modell** (a quantal tovább-tréning).
- **[mesh] Q11** — internet nélkül is él: a **vaked.dev zóna** (DNS-szint).
- **[mesh] Q13** — SPOF, amit replikálni kell: **coder.vaked.dev**.
- **[people] Q14** — a barátokért: **coder.vaked.dev ingyenes "node member" tier**.
- **[fleet] Q15** — mérni: **nodes, TFLOPs, latency**.
- **[mesh] Q19** — a meglepetés: **aterianawesome TFLOPs** (a 3090 tényleges számítási ereje, amit nem terveztél).
- **[people] Q20** — "idk" → **az öreg dönt** (lásd lentebb).

---

## 3. the open questions the skill must answer honestly

**Q8 — melyik protokoll a legtörékenyebb?** → **NATS.** Ok: a hub a Macen fut (SPOF), a `[federation]` most lett bekapcsolva, nincs replication/retry-stratégia a hub halálára, és a worker a NATS_URL-t a vast-on a localhost-ra várja (hub és worker között nincs hálózati elérés). Ez a legfiatalabb és legkevésbé próbált láncszem.

**Q17 — 10 dolog, amit 60 mp alatt deployolnál one-click installerrel:**
1. `nats-server --jetstream` (hub node)
2. `entheai-worker --serve` (worker node)
3. `tailscale up` (mesh-tag)
4. `nixos-anywhere` (új flotta-host)
5. `cloudflared tunnel` (public név)
6. quantal tréning job (GPU node)
7. `headscale` control plane (Q1)
8. sops key-host (kulcs-tartó)
9. `coder.vaked.dev` replica (Q13)
10. `honest-irc` relay (a mesh chatje)

**Q20 — az egyetlen akcióképes tétel (az öreg döntése):**

---

## 4. ordered actions

1. **A NATS hub átköltöztetése a Macről dev-cx53-ra (nix-native)** — what: systemd service a flottán (`peterlodri.nats.enable`), why: a hub-SPOF megszűnik, a worker a tailneten éri el, why-most: Q3+Q8 egyszerre zárja. verify: `nh os switch .#dev-cx53` → `nats://dev-cx53.tail…:4222` ping.

2. **headscale a tailscale hálón belül (Q1)** — what: juanfont/headscale egy flotta-hoston, why: a mesh saját control plane-t kap, a tailscale-t nem veszi ki, hanem kiegészíti. verify: saját node csatlakozik a headscale-re.

3. **quantal tovább-tréning a vast-on (Q10)** — what: a 168 mátrix modell tovább-tréning a 3090 MLX CUDA-val, why: a tehetetlen GPU végre dolgozik, az attestal-ba bekötve. verify: loss csökken, új mátrixok exportálva.

4. **coder.vaked.dev replica (Q13)** — what: a szolgáltatás második node-ja, why: az egyetlen név szerint említett SPOF. verify: failover teszt.

---

## 5. ONE actionable item

> **→ DO THIS FIRST: költöztesd a NATS hubot a Macről dev-cx53-ra, nix-native módon.**

Miért ez az egy: a Q3 (dev-cx53 = leggyengébb láncszem) és a Q8 (NATS = legtörékenyebb protokoll) ugyanoda mutat — **a hub a Macen él, és ez az egyetlen pont, ami ha meghal, az egész mesh meghal.** Ez az a lépés, ami minden mást (headscale, worker, family node-ok) megbízhatóvá tesz, mert a gerinc nem a te alvó gépedtől függ.

A nix-base-ben a `peterlodri.nats.enable` modul, a sops-szal a kulcs, és a `nh os switch .#dev-cx53` a deploy. 2–6 hét, ahogy az öreg mondta — és ez az első tégla.

---

· mesh-expand · {n+-1-<△>} · 0+1 ·
