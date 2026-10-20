#!/usr/bin/env bash
set -euo pipefail
URL="${1:-}"
if [[ -z "$URL" ]]; then
  echo "Usage: $0 http://<load-balancer-public-ip>"
  exit 2
fi
echo "Checking endpoint: $URL"
for attempt in $(seq 1 10); do
  if curl --fail --silent --show-error --max-time 5 "$URL"; then
    echo
    echo "Health check passed (attempt $attempt)."
    exit 0
  fi
  echo "Attempt $attempt failed; retrying..."
  sleep 3
done
echo "Health check failed after 10 attempts."
exit 1
