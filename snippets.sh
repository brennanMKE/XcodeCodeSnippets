#!/bin/sh

GitRoot="`dirname \"$0\"`"
Prefix="sst_"

case "$1" in
    update)
        echo Updating...
        pushd .
        cd ${GitRoot}
        git pull
        cp ${Prefix}*.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
        popd
        ;;
    list)
        echo Listing...
        ls ~/Library/Developer/Xcode/UserData/CodeSnippets/${Prefix}*.codesnippet
        ;;
    find)
        echo Finding...
        ls ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet | grep -v ${Prefix}
        ;;
    import)
        echo Importing...
        pushd .
        cd ${GitRoot}
        cp ~/Library/Developer/Xcode/UserData/CodeSnippets/${Prefix}*.codesnippet .
        ./bin/snippetimporter ~/Library/Developer/Xcode/UserData/CodeSnippets . ${Prefix}
        popd
        ;;
    export)
        echo Exporting...
        cp ${GitRoot}/${Prefix}*.codesnippet ~/Library/Developer/Xcode/UserData/CodeSnippets/
        ;;
    clear)
        echo Clearing...
        pushd .
        cd ${GitRoot}
        rm ~/Library/Developer/Xcode/UserData/CodeSnippets/${Prefix}*.codesnippet
        popd
        ;;
    *)
        echo "Usage: `basename $0` { update | list | find | import | export | clear }"
        ;;
esac

