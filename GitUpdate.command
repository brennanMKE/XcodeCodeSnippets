#!/bin/sh

GitRoot="`dirname \"$0\"`"

pushd .
cd ${GitRoot}
git pull
cp sst_*.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
popd

