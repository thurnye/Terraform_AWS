#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
ENVIRONMENT="${1:-dev}"
case "$ENVIRONMENT" in dev|staging|prod) ;; *) echo "Usage: $0 [dev|staging|prod]" >&2; exit 1 ;; esac
"$ROOT/scripts/bootstrap.sh" "$ENVIRONMENT"
terraform -chdir="$ROOT/environments/$ENVIRONMENT" validate
# Terraform displays the plan and asks for approval before applying.
terraform -chdir="$ROOT/environments/$ENVIRONMENT" apply
