//
//  MapGraph.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "MapGraph.h"

@implementation MapGraph

- (id)init
{
    self = [super init];
    if (self)
    {
        _nodes = [[NSMutableDictionary alloc] init];
        _adjacencyMatrix = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addNode:(Node *)node
{
    if (node.id == nil)
    {
        NSLog(@"Warning: ID not defined for node");
        node.id = [NSString stringWithFormat:@"(%f,%f)", node.xCoord, node.yCoord];
    }
    if ([_adjacencyMatrix objectForKey:node] == nil)
    {
        [_nodes setObject:node forKey:node.id];
        NSMutableSet *adjacentNodes = [[NSMutableSet alloc] init];
        [_adjacencyMatrix setObject:adjacentNodes forKey:node];
    }
}

- (void)addEdge:(Edge *)edge
{
    // make sure nodes exist
    [self addNode:edge.node1];
    [self addNode:edge.node2];
    
    [[_adjacencyMatrix objectForKey:edge.node1] addObject:edge];
    
    [[_adjacencyMatrix objectForKey:edge.node2] addObject:edge];
}

- (void)addEdgeFromNode:(NSString *)nodeId1 toNode:(NSString *)nodeId2
{
    Node *n1 = [_nodes objectForKey:nodeId1];
    Node *n2 = [_nodes objectForKey:nodeId2];
    
    // make sure nodes exist
    if (n1 == nil || n2 == nil) {
        return;
    }
    
    Edge *e = [[Edge alloc]init];
    e.node1 = n1;
    e.node2 = n2;
    [self addEdge:e];
}

- (Node *)getNodeById:(NSString *)id
{
    return [_nodes objectForKey:id];
}

/**
 * Returns a dictionary with keys being adjacent Nodes and values being the Edges
 */
- (NSSet *)getAdjacentNodes:(Node *)node
{
    return [_adjacencyMatrix objectForKey:node];
}

@end
