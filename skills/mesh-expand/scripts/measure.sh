#!/bin/bash
# measure.sh — best-effort local mesh measurement (run on a host in the mesh)
# Read-only: prints what it can find. Never guesses.
echo "== local host =="
hostname; uname -m
echo
echo "== cpu/load =="
[ -f /proc/loadavg ] && cat /proc/loadavg || sysctl -n vm.loadavg 2>/dev/null
echo
echo "== nats =="
if command -v nc >/dev/null 2>&1; then
  nc -z -w 2 localhost 4222 && echo "nats :4222 UP" || echo "nats :4222 down (or nc blocked)"
fi
echo
echo "== tailscale =="
command -v tailscale >/dev/null 2>&1 && tailscale status 2>/dev/null | head -8 || echo "tailscale CLI not found"
echo
echo "== entheai worker =="
pgrep -f "entheai-worker" >/dev/null 2>&1 && echo "entheai-worker RUNNING" || echo "entheai-worker not running"
