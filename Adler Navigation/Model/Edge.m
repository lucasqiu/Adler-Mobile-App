//
//  Edge.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "Edge.h"

@implementation Edge

- (float)distance
{
    return sqrtf( pow(_node1.xCoord-_node2.xCoord,2) +
                 pow(_node1.yCoord-_node2.yCoord,2) );
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }
    if (!other || ![other isKindOfClass:[self class]]) {
        return NO;
    }
    return [self isEqualToEdge:other];
}

- (BOOL)isEqualToEdge:(Edge *)otherEdge
{
    return ([_node1 isEqual:otherEdge.node1] && [_node2 isEqual:otherEdge.node2])
            || ([_node2 isEqual:otherEdge.node1] && [_node1 isEqual:otherEdge.node2]);
}

- (NSUInteger)hash
{
    NSUInteger prime = 31;
    NSUInteger hash = 1;
    
    hash = hash * prime + (_node1 == nil ? 0 : [_node1 hash]);
    hash = hash * prime + (_node2 == nil ? 0 : [_node2 hash]);
    
    return hash;
}

@end
