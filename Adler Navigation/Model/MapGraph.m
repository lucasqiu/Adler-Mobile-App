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
        node.id = [NSString stringWithFormat:@"(%f,%f,%f)", node.xCoord,
                   node.yCoord, node.zCoord];
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
 * Returns a set of Edge objects
 */
- (NSSet *)getAdjacentEdges:(Node *)node
{
    return [_adjacencyMatrix objectForKey:node];
}

/**
 * Returns an array of UIDs for adjacent nodes
 */
- (NSArray *)getIDsOfAdjacentNodes:(Node *)node
{
    NSMutableArray * adjacentNodeUIDs = [[NSMutableArray alloc] init];
    NSSet * edges = [_adjacencyMatrix objectForKey:node];
    for(Edge * currentEdge in edges) {
        NSString * node1ID = currentEdge.node1.id;
        NSString * node2ID = currentEdge.node2.id;
        
        if(![node1ID isEqualToString:node.id]) {
            [adjacentNodeUIDs addObject:node1ID];
        }
        
        if(![node2ID isEqualToString:node.id]) {
            [adjacentNodeUIDs addObject:node2ID];
        }
    }
    
    return adjacentNodeUIDs;
}

- (void)addGraphNodesFromFile:(NSString *)filePath
{
    NSArray * nodeDataArray = [[NSArray alloc] initWithContentsOfFile:filePath];    //array containing dict objects
    
    for(id nodeDict in nodeDataArray){
        NSString * uniqueID = [nodeDict objectForKey:@"uid"];
        NSString * nodeType = [nodeDict objectForKey:@"type"];
        NSNumber * xCoordinate = [nodeDict objectForKey:@"x"];
        NSNumber * yCoordinate = [nodeDict objectForKey:@"y"];
        NSNumber * zCoordinate = [nodeDict objectForKey:@"z"];
        
        Node * newNode;
        
        if([nodeType isEqualToString:@"exit"]) {
            newNode = [[ExitNode alloc] init];
        }
        
        else if([nodeType isEqualToString:@"travel"]) {
            newNode = [[TravelNode alloc] init];
        }
        
        else {
            newNode = [[ExhibitNode alloc] init];
        }
        
        newNode.xCoord = [xCoordinate floatValue];
        newNode.yCoord = [yCoordinate floatValue];
        newNode.zCoord = [zCoordinate floatValue];
        newNode.id = uniqueID;
        
        [self addNode:newNode];
    }
}

- (void)addGraphEdgesFromFile:(NSString *)filePath
{
    NSArray * nodeDataArray = [[NSArray alloc] initWithContentsOfFile:filePath];    //array containing dict objects
    
    for(id nodeDict in nodeDataArray) {
        NSString * uniqueID = [nodeDict objectForKey:@"uid"];
        NSArray * adjacentNodes = [nodeDict objectForKey:@"adjacent"];
        
        for(id nodeID in adjacentNodes) {
            [self addEdgeFromNode:uniqueID toNode:nodeID];
        }
    }
}

- (void) createGraphFromFile:(NSString *) filePath
{
    //should the destructor be called here to clear out existing data in the graph?
    [self addGraphNodesFromFile:filePath];
    [self addGraphEdgesFromFile:filePath];
}

@end
