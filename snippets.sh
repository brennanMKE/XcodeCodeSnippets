#!/bin/sh

GitRoot="`dirname \"$0\"`"

case "$1" in
    update)
        echo Updating...
        pushd .
        cd ${GitRoot}
        git pull
        cp sst_*.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
        popd
        ;;
    list)
        echo Listing...
        ls ~/Library/Developer/Xcode/UserData/CodeSnippets/sst_*.codesnippet
        ;;
    find)
        echo Finding...
        ls ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet | grep -v sst_
        ;;
    import)
        echo Importing...
        pushd .
        cd ${GitRoot}
        cp ~/Library/Developer/Xcode/UserData/CodeSnippets/sst_*.codesnippet .
        popd
        ;;
    export)
        echo Exporting...
        cp ${GitRoot}/sst_*.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
        ;;
    clear)
        echo Clearing...
        pushd .
        cd ${GitRoot}
        rm ~/Library/Developer/Xcode/UserData/CodeSnippets/sst_*.codesnippet
        popd
        ;;
    *)
        echo "Usage: `basename $0` { update | list | find | import | export | clear }"
        ;;
esac

