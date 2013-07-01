//
//  SnippetImporter.h
//  SnippetImporter
//
//  Created by Brennan Stehling on 6/30/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SnippetImporter : NSObject

- (void)importSnippetsWithSourcePath:(NSString *)sourcePath destinationPath:(NSString *)destinationPath prefix:(NSString *)prefix;

@end
