#!/bin/bash
# plan.sh — print the mesh-expand plan template
cat <<'EOF'
# mesh expansion plan

## measured state (from real configs — fill, don't guess)

| node | role | cpu | gpu | network | utilisation |
|------|------|-----|-----|---------|-------------|
|      |      |     |     |         |             |

## answers

- [mesh] Q1:
- [fleet] Q2:
- [people] Q5:
- (…add rows for answered questions)

## ordered actions

1. what / why / how / verify
2. what / why / how / verify
3. what / why / how / verify

## one actionable item

→ DO THIS FIRST:
EOF
