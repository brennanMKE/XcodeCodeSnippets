#!/bin/sh

GitRoot="`dirname \"$0\"`"

pushd .
cd ${GitRoot}
cp ~/Library/Developer/Xcode/UserData/CodeSnippets/sst_*.codesnippet .
popd

