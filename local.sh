#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")"

PYTHON="/usr/bin/python3"

echo "Building AURA Portal Training (strict validation)..."
"$PYTHON" -m sphinx -b html -n -W --keep-going docs build/html

echo "Build successful — opening training Portal."
if command -v open >/dev/null 2>&1; then
    open build/html/index.html
else
    echo "Open build/html/index.html in your browser."
fi
