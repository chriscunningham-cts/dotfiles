#! /bin/bash

git checkout -q "${1:-main}" && git for-each-ref refs/heads/ "--format=%(refname:short)" |
  while read -r branch; do
    mergeBase=$(git merge-base "${1:-main}" "$branch") && [[ $(git cherry "${1:-main}" $(git commit-tree $(git rev-parse "$branch^{tree}") -p "$mergeBase" -m _)) == "-"* ]] && git branch -D "$branch"
  done
