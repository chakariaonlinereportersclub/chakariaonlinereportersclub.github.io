#!/bin/sh

# If a command fails then deploy stops
set -e

printf 	"\033[0;32mDeploying updates to Github...\033[0m\n"

# Build the project
hugo -t hugo-clarity

# Go To Public folder
cd public

# add changes to git
git add .

# Commit Changes
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi
git commit -m "$msg"

# Push source and build repos
git push origin main
