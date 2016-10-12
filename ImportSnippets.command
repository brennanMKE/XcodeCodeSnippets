#!/bin/sh

set -e

GitRoot="`dirname \"$0\"`"
SnippetsDir="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"

if [ ! -d "${SnippetsDir}" ]; then
    mkdir -p "${SnippetsDir}"
fi

pushd .
cd "${GitRoot}"
cp "${SnippetsDir}/sst_*.codesnippet" .
popd
