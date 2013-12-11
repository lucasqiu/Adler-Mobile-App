//
//  ExitNode.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "ExitNode.h"

@implementation ExitNode

- (BOOL)inRoom:(NSString *)room
{
    return room == _room1 || room == _room2;
}

@end
