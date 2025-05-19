#!/usr/bin/env bash
# This script creates a new repository on GitHub and initializes it with a README file.
newrepo() {
    mkdir "$1" && cd "$1" || exit 1
    git init
    echo "# $1" >>README.md
    git add .
    git commit -m "Init"
    gh repo create "$1" --private --source=. --push
    echo "Repository $1 created and pushed to GitHub."
}
