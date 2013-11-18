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

@end
