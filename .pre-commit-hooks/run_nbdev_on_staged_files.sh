#!/usr/bin/env bash

set -euo pipefail

conda_env_name="nds_env"

if ! command -v conda >/dev/null 2>&1; then
    echo "Error: conda is not available, cannot run nbdev-clean in ${conda_env_name}." >&2
    exit 1
fi

for arg in "$@"; do
    conda run -n "${conda_env_name}" nbdev-clean --fname "$arg" # removes only metadata
    # conda run -n "${conda_env_name}" nbdev-clean --clear_all --fname "$arg" # removes outputs and metadata
done