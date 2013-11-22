//
//  MapGraph.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "Edge.h"
#import "ExhibitNode.h"
#import "ExitNode.h"
#import "TravelNode.h"

@interface MapGraph : NSObject

// id -> node
@property (strong, nonatomic) NSMutableDictionary *nodes;
// node -> set of edges
@property (strong, nonatomic) NSMutableDictionary *adjacencyMatrix;

- (void)addNode:(Node *)node;
- (void)addEdge:(Edge *)edge;
- (void)addEdgeFromNode:(NSString *)nodeId1 toNode:(NSString *)nodeId2;

- (Node *)getNodeById:(NSString *)id;

/**
 * Returns a set of Edge objects
 */
- (NSSet *)getAdjacentNodes:(Node *)node;

- (NSArray *)getIDsOfAdjacentNodes:(Node *)node;

- (void) createGraphFromFile:(NSString *) filePath;

@end
