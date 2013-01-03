#!/bin/sh

GitRoot="`dirname \"$0\"`"

pushd .
cd ${GitRoot}
git pull
cp *.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
popd

