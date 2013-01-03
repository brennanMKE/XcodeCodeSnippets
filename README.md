# Xcode 4 Code Snippets
## Brennan Stehling
### SmallSharpTools.com

--------------------------------------

I've created or collected the following code snippets to speed up my work. My snippets focus on a few areas.

* animation
* blocks
* async (GCD and queues)
* notifications
* debugging
* formatting

To use the snippets you will want to place them in the following folder.

~/Library/Developer/Xcode/UserData/CodeSnippets

There is an import and export script which can be used to handle putting these files in place.

You will need to restart Xcode to see the change.

I am open to feedback on improving this code or adding more code snippets which would compliment them.

## Filename Prefix

The filenames have a prefix of SST for SmallSharpTools, which is my company. This is done to make it easier to
use these snippets alongside other snippets you may want to use either that you created or another GitHub repo.
A script named GitUpdate.command is included which will pull the latest from GitHub and copy the code snippets
in place. If you were to automate this script you could automatically stay current with these snippets. Updates
are made periodically to add new snippets or to adjust snippets due to a bug or changes to iOS/Mac APIs.

## Caveat

I found that copying a snippet to create a modified version without changing the Guid value causes Xcode to crash.
I expect a conflicting keyword would also be a problem. The import/export process to sync snippet collections should
handle these details to ensure different files do not cause conflicts. This would likely require a command-line
utility or a more advanced shell script.
