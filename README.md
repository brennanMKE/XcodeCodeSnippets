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

## Future Updates

I realize that it would be useful combine this collection of code snippets with others which I have found on GitHub
and for others to carefully include mine with their collection. I think I will start preparing a naming convention
so that my collection can be safely identified so the included import/export scripts can handle pulling updates
from GitHub and automatically copying the updates in place without conflicting with other snippets.

## Caveat

I found that copying a snippet to create a modified version without changing the Guid value causes Xcode to crash.
I expect a conflicting keyword would also be a problem. The import/export process to sync snippet collections should
handle these details to ensure different files do not cause conflicts. This would likely require a command-line
utility or a more advanced shell script.
