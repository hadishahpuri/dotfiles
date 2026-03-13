#!/bin/bash

echo "******** Target branch *********"
echo "$1"
echo "******** Assignee *********"
echo "$2"
echo "******** Reviewer *********"
echo "$3"

localBranch=$(git rev-parse --abbrev-ref HEAD)
echo "******** Local branch *********"
echo "$localBranch"

git remote get-url origin | grep gitlab && git push -u origin HEAD \
    -o merge_request.create \
    -o merge_request.target="$1" \
    -o merge_request.assign="$2" \
    -o merge_request.reviewer="$3" \
    -o merge_request.title="$localBranch" || git push -u origin HEAD
