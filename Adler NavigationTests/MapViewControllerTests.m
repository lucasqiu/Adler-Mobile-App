//
//  MapViewControllerTests.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/23/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapViewController.h"
#import "Node.h"
#import "ExitNode.h"
#import "TravelNode.h"
#import "ExhibitNode.h"
#import "MapGraph.h"

@interface MapViewControllerTests : XCTestCase

@end

@implementation MapViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testPathText
{
    ExhibitNode *n1 = [[ExhibitNode alloc] init];
    n1.room = @"room1";
    
    ExitNode *n2 = [[ExitNode alloc] init];
    n2.room2 = @"room1";
    n2.room1 = @"room2";
    
    ExhibitNode *n3 = [[ExhibitNode alloc] init];
    n3.room = @"room2";
    
//    Node *n4 = [[Node alloc] init];
    
    NSArray *path = @[n1, n2, n3];
    
    [MapViewController nextDirection:path];
}

- (void)testDijkstra
{
    MapGraph *g;
    Node *n1;
    Node *n2;
    Node *n3;
    Node *n4;
    Edge *e12;
    Edge *e13;
    Edge *e34;
    
    [super setUp];
    
    g = [[MapGraph alloc] init];
    
    n1 = [[Node alloc] init];
    n1.xCoord = 1;
    n1.yCoord = 1;
    
    n2 = [[Node alloc] init];
    n2.xCoord = 2;
    n2.yCoord = 13;
    
    n3 = [[Node alloc] init];
    n3.xCoord = 2.5;
    n3.yCoord = 7;
    
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
    
    e34 = [[Edge alloc] init];
    e34.node1 = n3;
    e34.node2 = n4;
    
    [g addEdge:e12];
    [g addEdge:e13];
    [g addEdge:e34];
    
//    NSArray *path = [MapViewController dijkstra:g from:n1 to:n3];
    NSArray *expected = @[n1, n3];
//    XCTAssertEqual(path, expected);
    
//    path = [MapViewController dijkstra:g from:n1 to:n4];
    expected = @[n1, n3, n4];
//    XCTAssertEqual(path, expected);
}

@end
