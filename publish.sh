#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")"
EXPECTED="MIH-aqteam/AQ_Portal_Training"
echo "AURA PORTAL TRAINING — restricted to $EXPECTED"
[[ -f docs/conf.py ]] || exit 1
[[ "$(git branch --show-current)" == "main" ]] || { echo "Wrong branch"; exit 1; }
remote="$(git remote get-url origin)"
case "$remote" in
  "https://github.com/$EXPECTED"|"https://github.com/$EXPECTED.git"|"git@github.com:$EXPECTED.git") ;;
  *) echo "STOP: origin is not training repository: $remote"; exit 1 ;;
esac
/usr/bin/python3 -m sphinx -b html -n -W --keep-going docs build/html
git status --short
read -r -p "Stage changes? [y/N] " answer
[[ "$answer" == y || "$answer" == Y ]] || exit 0
git add -A
git diff --cached --stat
read -r -p "Commit? [y/N] " answer
[[ "$answer" == y || "$answer" == Y ]] || exit 0
read -r -p "Commit message: " message
[[ -n "$message" ]] || exit 1
git commit -m "$message"
read -r -p "Push to TRAINING repository? [y/N] " answer
[[ "$answer" == y || "$answer" == Y ]] || exit 0
git push origin main
