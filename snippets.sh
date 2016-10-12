#!/bin/sh

set -e

GitRoot="`dirname \"$0\"`"
Prefix="sst_"
SnippetsDir="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"

if [ ! -d "${SnippetsDir}" ]; then
    mkdir -p "${SnippetsDir}"
fi

case "$1" in
    update)
        echo Updating...
        pushd .
        cd ${GitRoot}
        git pull
        cp ${Prefix}*.codesnippet "${SnippetsDir}"
        popd
        ;;
    list)
        echo Listing...
        ls "${SnippetsDir}"/${Prefix}*.codesnippet
        ;;
    find)
        echo Finding...
        ls "${SnippetsDir}/*.codesnippet" | grep -v ${Prefix}
        ;;
    import)
        echo Importing...
        pushd .
        cd ${GitRoot}
        cp "${SnippetsDir}/${Prefix}*.codesnippet" .
        ./bin/snippetimporter "${SnippetsDir}" . ${Prefix}
        popd
        ;;
    export)
        echo Exporting...
        cp ${GitRoot}/${Prefix}*.codesnippet "${SnippetsDir}"
        ;;
    clear)
        echo Clearing...
        pushd .
        cd ${GitRoot}
        rm "${SnippetsDir}/${Prefix}*.codesnippet"
        popd
        ;;
    *)
        echo "Usage: `basename $0` { update | list | find | import | export | clear }"
        ;;
esac

