//
//  MapGraph.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "MapGraph.h"

@implementation MapGraph

- (void)addNode:(Node *) node
{
    if ([_adjacencyMatrix objectForKey:node])
    {
        NSDictionary *adjacentNodes = [[NSDictionary alloc] init];
        [_adjacencyMatrix setObject:node forKey:adjacentNodes];
    }
}

- (void)addEdge:(Edge *) edge
{
    [self addNode:edge.node1];
    [self addNode:edge.node2];
    
    [[_adjacencyMatrix objectForKey:edge.node1]
     setObject:edge forKey:edge.node2];
    
    [[_adjacencyMatrix objectForKey:edge.node2]
     setObject:edge forKey:edge.node1];
}

/**
 * Returns a dictionary with keys being adjacent Nodes and values being the Edges
 */
- (NSDictionary *)getAdjacecentNodes:(Node *)node
{
    return [_adjacencyMatrix objectForKey:node];
}

@end
