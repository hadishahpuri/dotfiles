#!/bin/bash

echo "************************"
echo $1

echo "--------------------------"
echo $2

git remote get-url origin | grep gitlab && git push -u origin HEAD -o merge_request.create -o merge_request.target=$1 -o merge_request.title=$2 || git push -u origin HEAD
