#!/bin/sh

GitRoot="`dirname \"$0\"`"

pushd .
cd ${GitRoot}
rm ~/Library/Developer/Xcode/UserData/CodeSnippets/sst_*.codesnippet
popd

