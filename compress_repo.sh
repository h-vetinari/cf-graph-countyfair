#!/usr/bin/env bash

echo "Compressing repo to only the local commits..."
git replace -f --graft $(git rev-list --max-parents=0 HEAD)
git filter-repo --force

echo "\nCleaning out the git database..."
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo "\nForce pushing upstream..."
git push --force
