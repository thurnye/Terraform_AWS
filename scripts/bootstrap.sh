#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
ENVIRONMENT="${1:-dev}"
case "$ENVIRONMENT" in dev|staging|prod) ;; *) echo "Usage: $0 [dev|staging|prod]" >&2; exit 1 ;; esac
TARGET="$ROOT/environments/$ENVIRONMENT"
if [[ ! -f "$TARGET/.terraform.lock.hcl" ]]; then
  cp "$ROOT/.terraform.lock.hcl" "$TARGET/.terraform.lock.hcl"
fi
terraform -chdir="$TARGET" init
