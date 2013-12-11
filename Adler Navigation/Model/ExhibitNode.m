//
//  ExhibitNode.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/21/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "ExhibitNode.h"

@implementation ExhibitNode

- (BOOL)inRoom:(NSString *)room
{
    return room == _room;
}

@end
