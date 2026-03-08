#!/usr/bin/env zsh
set -e

INTERVAL="${1:-30}"

echo "Auto-sync started for $(pwd)"
echo "Checking every ${INTERVAL} seconds. Press Ctrl+C to stop."

while true; do
  if [[ -n "$(git status --porcelain)" ]]; then
    git add -A
    git commit -m "auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    echo "Synced at $(date '+%H:%M:%S')"
  fi

  sleep "$INTERVAL"
done
