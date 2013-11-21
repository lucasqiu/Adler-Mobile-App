//
//  MapGraphTests.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/20/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapGraph.h"

@interface MapGraphTests : XCTestCase

@end

@implementation MapGraphTests

MapGraph *g;
Node *n1;
Node *n2;
Node *n3;
Node *n4;
Edge *e12;
Edge *e13;

- (void)setUp
{
    [super setUp];
    
    g = [[MapGraph alloc] init];
    
    n1 = [[Node alloc] init];
    n1.xCoord = 1;
    n1.yCoord = 11;
    
    n2 = [[Node alloc] init];
    n2.xCoord = 2;
    n2.yCoord = 12;
    
    n3 = [[Node alloc] init];
    n3.xCoord = 3;
    n3.yCoord = 13;
    
    n4 = [[Node alloc] init];
    n4.xCoord = 4;
    n4.yCoord = 14;
    
    [g addNode:n1];
    [g addNode:n2];
    [g addNode:n3];
    [g addNode:n4];
    
    e12 = [[Edge alloc]init];
    e12.node1 = n1;
    e12.node2 = n2;
    
    e13 = [[Edge alloc]init];
    e13.node1 = n3;
    e13.node2 = n1;
    
    [g addEdge:e12];
    [g addEdge:e13];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testAddNode
{
    XCTAssertNotNil([g.adjacencyMatrix objectForKey:n1]);
    XCTAssertNotNil([g.adjacencyMatrix objectForKey:n4]);
    
    Node *n = [[Node alloc] init];
    n.xCoord = 101;
    n.yCoord = 101;
    XCTAssertNil([g.adjacencyMatrix objectForKey:n]);
}

- (void)testGetNodeById
{
    Node *n = [[Node alloc] init];
    n.xCoord = 102;
    n.yCoord = 102;
    n.id = @"test";
    
    XCTAssertNil([g getNodeById:n.id]);
    
    [g addNode:n];
    XCTAssertEqualObjects(n, [g getNodeById:n.id]);
}

- (void)testAdjacent
{
    
    
    NSSet *adjacent = [g getAdjacentNodes:n1];
    NSSet *expected = [NSSet setWithObjects:e12, e13, nil];
    
    XCTAssertEqual([adjacent count], [expected count]);
    
    XCTAssertEqualObjects(adjacent, expected);
}

@end
