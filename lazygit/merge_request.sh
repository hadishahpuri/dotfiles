#!/bin/bash

echo "******** Target branch *********"
echo $1

localBranch=$(git rev-parse --abbrev-ref HEAD)
echo "******** Local branch *********"
echo $localBranch

git remote get-url origin | grep gitlab && git push -u origin HEAD -o merge_request.create -o merge_request.target=$1 -o merge_request.title=$localBranch || git push -u origin HEAD
