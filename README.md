# Xcode Code Snippets

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

The filenames have a prefix of SST for SmallSharpTools, which is my company. This is done to make it easier to use these snippets alongside other snippets you may want to use either that you created or another GitHub repo. A script named GitUpdate.command is included which will pull the latest from GitHub and copy the code snippets in place. If you were to automate this script you could automatically stay current with these snippets. Updates are made periodically to add new snippets or to adjust snippets due to a bug or changes to iOS/Mac APIs.

## Snippet Importer

Managing snippets has been a bit of a manual process. When a new snippet is created with Xcode a new file is added to the working folder with a long name which is not descriptive. The name which is used to name each file within this collection includes the collection prefix, the snippet completion prefix and the file extension. Renaming the automatic names to use this convention was a bit of copy/paste work which has not been eliminated with the Snippet Importer project which builds a command-line utility which is used to copy new files from the working folder to the managed Git folder with a filename using the naming convention and then copied to the working folder again where Xcode will pick it up the next time it is relaunched. This command-line utility takes 3 parameters and also has the help switch (-?) like most utilities. The script snippets.sh uses it in the import option to import newly created snippets to the managed Git folder where the changes can be added and committed to the repository.

This project and the new importer script are built to help with anyone manage their collection with their own prefix.

## Caveat

I found that copying a snippet to create a modified version without changing the Guid value causes Xcode to crash. I expect a conflicting keyword would also be a problem. The import/export process to sync snippet collections should handle these details to ensure different files do not cause conflicts. This would likely require a command-line utility or a more advanced shell script.

## License

Xcode Code Snippets are available under the MIT license. See the LICENSE file for more info.

## Contact

Brennan Stehling  
[SmallSharpTools](http://www.smallsharptools.com/)  
[@smallsharptools](https://twitter.com/smallsharptools) (Twitter)  

