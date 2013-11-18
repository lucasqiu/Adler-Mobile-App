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

@interface MapGraph : NSObject

@property (strong, nonatomic) NSMutableDictionary *adjacencyMatrix;

- (void)addNode:(Node *) node;
- (void)addEdge:(Edge *) edge;
- (NSSet *)getAdjacecentNodes:(Node *) node;

@end
