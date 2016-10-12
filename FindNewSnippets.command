#!/bin/sh

set -e

SnippetsDir="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"

if [ ! -d "${SnippetsDir}" ]; then
    mkdir -p "${SnippetsDir}"
fi

ls "${SnippetsDir}/*.codesnippet" | grep -v sst_
