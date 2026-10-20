#!/usr/bin/env bash
set -euo pipefail
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo: sudo $0"
  exit 1
fi
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
systemctl enable --now nginx
systemctl --no-pager --full status nginx
