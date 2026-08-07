# mesh-expand — references

## sovereign fleet glossary

| term | meaning |
|------|---------|
| mesh | the interconnected nodes (NATS hub + workers + satellites) |
| fleet | the physical/cloud hosts running the mesh |
| node | one host running a worker/satellite role |
| hub | the NATS JetStream server the workers pull from |
| worker | a node running `entheai-worker --serve` |
| satellite | a leaf node (e.g. an Asahi Linux or Raspberry Pi) |
| sovereign | infrastructure you control end-to-end (hardware → keys → data) |
| lovetta lane | the funding channel (github sponsor / revolut / wise) |

## capacity numbers worth measuring

- node count + role
- GPU: TFLOPs, VRAM, utilisation %
- network: latency between hubs, tailnet reachability
- uptime per node
- federation queue depth (ENTHEAI_WORK stream)

## the "one actionable item" rule

A brainstorm that ends in twenty vague ideas is worth less than one
measured next step. The skill's Q20 forces the choice: pick the single
highest-leverage action and mark it `→ DO THIS FIRST`.
