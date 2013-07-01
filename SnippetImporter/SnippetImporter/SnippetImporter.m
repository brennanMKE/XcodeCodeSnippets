//
//  SnippetImporter.m
//  SnippetImporter
//
//  Created by Brennan Stehling on 6/30/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SnippetImporter.h"

#import <stdlib.h>

@implementation SnippetImporter

- (void)importSnippetsWithSourcePath:(NSString *)sourcePath destinationPath:(NSString *)destinationPath prefix:(NSString *)prefix {
    
    NSURL *sourceURL = [NSURL URLWithString:[self resolvePath:sourcePath]];
    NSURL *destinationURL = [NSURL URLWithString:[self resolvePath:destinationPath]];
    
//    DebugLog(@"source: %@", sourceURL.absoluteString);
//    DebugLog(@"destination: %@", destinationURL.absoluteString);
//    for (NSString *path in @[@"~/", @".", @"..", sourceURL.absoluteString, destinationURL.absoluteString]) {
//        DebugLog(@"Resolved Path: %@", [self resolvePath:path]);
//    }
    
    BOOL isDirectory = TRUE;
    if (![[NSFileManager defaultManager] fileExistsAtPath:sourceURL.absoluteString isDirectory:&isDirectory]) {
        printf("Source Path does not exist: %s\n", [sourceURL.absoluteString UTF8String]);
        return;
    }
    else if (![[NSFileManager defaultManager] fileExistsAtPath:destinationURL.absoluteString isDirectory:&isDirectory]) {
        printf("Destination Path does not exist: %s\n", [destinationURL.absoluteString UTF8String]);
        return;
    }
    else if (!prefix.length) {
        printf("Prefix must be defined\n");
        return;
    }
    
//    return;
    
    NSError *error = nil;
    NSArray *directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sourceURL.absoluteString error:&error];
    if (error ) {
        printf("Error: %s\n", [error.description UTF8String]);
    }
    else {
        for (NSString *filename in directoryContents) {
            if (![filename hasPrefix:prefix] && [filename rangeOfString:@".codesnippet"].location != NSNotFound) {
                NSURL *fileURL = [sourceURL URLByAppendingPathComponent:filename];
                
                NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:fileURL.absoluteString];
                NSString *completionPrefix = plist[@"IDECodeSnippetCompletionPrefix"];
                
                if (!completionPrefix.length) {
                    printf("Snippet needs a completion prefix: %s\n", [fileURL.lastPathComponent UTF8String]);
                }
                else {
                    NSString *newName = [NSString stringWithFormat:@"%@%@.codesnippet", prefix, completionPrefix];
                    NSURL *newURL = [destinationURL URLByAppendingPathComponent:newName];
                    if ([[NSFileManager defaultManager] fileExistsAtPath:newURL.absoluteString]) {
                        printf("Snippet named '%s' already exists\n", [newName UTF8String]);
                    }
                    else {
                        // do the move and copy operations
                        NSError *error = nil;
                        printf("Renaming %s to %s\n", [fileURL.lastPathComponent UTF8String], [newURL.lastPathComponent UTF8String]);
                        [[NSFileManager defaultManager] moveItemAtPath:fileURL.absoluteString toPath:newURL.absoluteString error:&error];
                        if (error) {
                            printf("Error: %s\n", [error.description UTF8String]);
                        }
                        else {
                            MAAssert(![[NSFileManager defaultManager] fileExistsAtPath:fileURL.absoluteString], @"Source file must not exist anymore");
                            MAAssert([[NSFileManager defaultManager] fileExistsAtPath:newURL.absoluteString], @"Destination file must exist");
                            
                            NSURL *copyURL = [sourceURL URLByAppendingPathComponent:newName];
                            
                            if (![[NSFileManager defaultManager] fileExistsAtPath:copyURL.path]) {
                                [[NSFileManager defaultManager] copyItemAtPath:newURL.absoluteString toPath:copyURL.absoluteString error:&error];
                                if (error) {
                                    printf("Error: %s\n", [error.description UTF8String]);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

- (NSString *)resolvePath:(NSString *)path {
    NSString *expandedPath = [[path stringByExpandingTildeInPath] stringByStandardizingPath];
    const char *cpath = [expandedPath cStringUsingEncoding:NSUTF8StringEncoding];
    char *resolved = NULL;
    char *returnValue = realpath(cpath, resolved);
    
    if (returnValue == NULL && resolved != NULL) {
        printf("Error with path: %s\n", resolved);
        // if there is an error then resolved is set with the path which caused the issue
        // returning nil will prevent further action on this path
        return nil;
    }
    
//    DebugLog(@"resolved: %s", resolved);
//    DebugLog(@"returnValue: %s", returnValue);
    
    return [NSString stringWithCString:returnValue encoding:NSUTF8StringEncoding];
}

@end
