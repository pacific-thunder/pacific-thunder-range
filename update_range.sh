#!/bin/bash
# Force update the Pacific Thunder Range repo to match remote

REPO_DIR="$HOME/Desktop/pacific-thunder-range"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo "❌ Repo not found at $REPO_DIR"
  exit 1
fi

cd "$REPO_DIR" || exit 1

# Detect current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "🔄 Resetting '$BRANCH' to match origin/$BRANCH ..."
git fetch --all
git reset --hard "origin/$BRANCH"
git clean -fd

echo "✅ Repo is now clean and up to date with origin/$BRANCH"