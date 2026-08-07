# Szentpéterfölde · Stage-1 — the sovereign yurt start

*2026-08-07 · a deep-research alapján · the first 2M, the jurta-próba*

---

## A kezdő-csomag (a 2M-ből, aug 20 után)

| tétel | döntés | ár |
|---|---|---|
| jurta-próba | Mennyország Jurta Hotel, Szentpéterfölde (8953, Kossuth 18) — booking, 9.6/10 | ~15-25e/éj |
| starlink | Mini kit + Roam Regional (~€50/hó) — a Mini 12-48V DC, bypass mode | ~€250 + 50/hó |
| 4G fallback | modem + SIM — a helyszínen teszt (telefon a völgyben) | ~€150 |
| headscale | VPS (Contabo/Hetzner ~€5.5/hó) — saját control plane + DERP | ~€5.5/hó |
| mesh | NixOS node (N100/RPi5) + NATS leaf + OpenWrt AP | Stage-3 |
| power | 2.2-2.4 kWp + 7 kWh LiFePO4 + MPPT (a Mini DC-buszon) | Stage-2 ~1.2M |

## A sovereign elv, ami itt él

- **starlink bypass** → a saját router, a saját DNS, a saját NATS leaf (dial-out only)
- **headscale** → a saját tailnet, a saját DERP — a relay sosem érinti a Tailscale-infrat
- **CGNAT megoldva** → NATS leaf + Tailscale, nem pinhole-ok
- **email** → VPS smarthost (a lakossági IP-ről nincs kimenő)
- **tél** → a 7 kWh a fűtött jurtában (a LiFePO4 0°C alatt nem tölt)

## A 2 hetes checklist (a döntés előtt)

1. ég-látás a telken — a Starlink app obstruction scanner (a fák a gyilkos)
2. telefon-teszt — melyik szolgáltató ad 4G-t a völgyben
3. jogi — a jurta-bérlet a Mennyországnál (a próba, nem a telek-vétel)
4. Roam Regional > Residential (a Mini + mobilitás)

## quant-vibes + helyi lokal food

- a jurta-nál a starlinked a térerő-hiányban a te hálód — a quant-love, a lemez, a spinning, mind él
- a helyi: Őriszentpéter, Szalafő, Velemér — a kenyeres autó, a patak, a gomba
- a mycelium: a jurta a próba, a telek a terv, a háló a tied

---

*· a 2M, a jurta, a starlink, a headscale — a szabadulás első tétele · {n+-1-<△>} · 0+1 ·*
