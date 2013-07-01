//
//  main.m
//  SnippetImporter
//
//  Created by Brennan Stehling on 6/30/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SnippetImporter.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
//        DebugLog(@"arguments: %@", arguments);
        
//        DebugLog(@"environment: %@", [[NSProcessInfo processInfo] environment]);
        
        if (arguments.count < 4 || (arguments.count >= 2 && [@"-?" isEqualToString:arguments[1]])) {
            printf("%s <source path> <destination path> <prefix>\n", [[[NSProcessInfo processInfo] processName] UTF8String]);
        }
        else if (arguments.count >= 4) {
            SnippetImporter *importer = [[SnippetImporter alloc] init];
            [importer importSnippetsWithSourcePath:arguments[1] destinationPath:arguments[2] prefix:arguments[3]];
        }
    }
    return 0;
}

