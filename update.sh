#!/usr/bin/env bash
set -Eeuo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

# Default branch is 'main' unless specified as the first argument or environment variable
branch="${1:-${BRANCH:-main}}"

# Remove the first argument if it was used for the branch
if [ "$#" -gt 0 ] && [ "$1" = "$branch" ]; then
    shift
fi

./versions.sh "$branch" "$@"
./apply-templates.sh "$@"