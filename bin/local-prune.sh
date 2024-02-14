#! /bin/bash

git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" |
  while read branch; do
    mergeBase=$(git merge-base master "$branch") && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p "$mergeBase" -m _)) == "-"* ]] && git branch -D "$branch"
  done
