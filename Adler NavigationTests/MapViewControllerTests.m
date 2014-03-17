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
/*    Node *n1 = [[Node alloc] init];
    n1.room = @"room1";
    
    Node *n2 = [[Node alloc] init];
    n2.room2 = @"room1";
    n2.room1 = @"room2";
    
    Node *n3 = [[Node alloc] init];
    n3.room = @"room2";
    
//    Node *n4 = [[Node alloc] init];
    
    NSArray *path = @[n1, n2, n3];
    
    [MapViewController nextDirection:path];
*/
}

- (void)testDijkstra1
{
    MapGraph *g;
    Node *n1;
    Node *n2;
    Node *n3;
    Node *n4;
    Edge *e12;
    Edge *e13;
    Edge *e34;
    Edge *e24;
    
    [super setUp];
    
    g = [[MapGraph alloc] init];
    
    n1 = [[Node alloc] init];
    n1.id = @"n1";
    n1.XCoordinate = 1;
    n1.yCoordinate = 1;
    
    n2 = [[Node alloc] init];
    n2.id = @"n2";
    n2.XCoordinate = 2;
    n2.yCoordinate = 13;
    
    n3 = [[Node alloc] init];
    n3.id = @"n3";
    n3.XCoordinate = 2.5;
    n3.yCoordinate = 7;
    
    n4 = [[Node alloc] init];
    n4.id = @"n4";
    n4.XCoordinate = 4;
    n4.yCoordinate = 14;
    
    [g addNode:n1];
    [g addNode:n2];
    [g addNode:n3];
    [g addNode:n4];
    
    e12 = [[Edge alloc]init];
    e12.node1 = n1;
    e12.node2 = n2;
    
    e13 = [[Edge alloc]init];
    e13.node1 = n1;
    e13.node2 = n3;
    
    e34 = [[Edge alloc] init];
    e34.node1 = n3;
    e34.node2 = n4;

    e24 = [[Edge alloc] init];
    e24.node1 = n2;
    e24.node2 = n4;
    
    [g addEdge:e12];
    [g addEdge:e13];
    [g addEdge:e34];
    [g addEdge:e24];
    
    NSArray *path = [MapViewController dijkstra:g from:n1 to:n4];
    NSArray *expected = @[n4, n3, n1];
    
    if(path){
        for(Node* n in path){
            NSLog(n.id);
        }
    }else{
        NSLog(@"path is nil !!!");
    }
 //   XCTAssertEqual([path isEqualToArray:expected]);
    //XCTAssertTrue([path isEqual:expected]);
    
//    path = [MapViewController dijkstra:g from:n1 to:n4];
    //expected = @[n1, n3, n4];
//    XCTAssertEqual(path, expected);
    return;
}


- (void)testDijkstra2
{
    MapGraph *g;
    
    Node *n1, *n2, *n3, *n4, *n5, *n6, *n7, *n8;
    
    Edge *e12, *e13, *e35, *e14, *e46, *e67, *e78, *e85, *e27, *e58;

    
    [super setUp];
    
    g = [[MapGraph alloc] init];
    
    n1 = [[Node alloc] init];
    n1.id = @"n1";
    n1.XCoordinate = 0;
    n1.yCoordinate = 0;
    
    n2 = [[Node alloc] init];
    n2.id = @"n2";
    n2.XCoordinate = 1;
    n2.yCoordinate = -1;
    
    n3 = [[Node alloc] init];
    n3.id = @"n3";
    n3.XCoordinate = 2;
    n3.yCoordinate = 10;
    
    n4 = [[Node alloc] init];
    n4.id = @"n4";
    n4.XCoordinate = 2;
    n4.yCoordinate = 1;

    n5 = [[Node alloc] init];
    n5.id = @"n5";
    n5.XCoordinate = 5;
    n5.yCoordinate = 5;
    
    n6 = [[Node alloc] init];
    n6.id = @"n6";
    n6.XCoordinate = 3;
    n6.yCoordinate = 1;
    
    n7 = [[Node alloc] init];
    n7.id = @"n7";
    n7.XCoordinate = 4;
    n7.yCoordinate = -1;
    
    n8 = [[Node alloc] init];
    n8.id = @"n8";
    n8.XCoordinate = 5;
    n8.yCoordinate = 1;
    
    [g addNode:n1]; [g addNode:n2];
    [g addNode:n3]; [g addNode:n4];
    [g addNode:n5]; [g addNode:n6];
    [g addNode:n7]; [g addNode:n8];
    
    e12 = [[Edge alloc]init];
    e12.node1 = n1;
    e12.node2 = n2;
    
    e13 = [[Edge alloc]init];
    e13.node1 = n1;
    e13.node2 = n3;
    
    e35 = [[Edge alloc]init];
    e35.node1 = n3;
    e35.node2 = n5;
    
    e14 = [[Edge alloc]init];
    e14.node1 = n1;
    e14.node2 = n4;
    
    e46 = [[Edge alloc]init];
    e46.node1 = n4;
    e46.node2 = n6;
    
    e67 = [[Edge alloc]init];
    e67.node1 = n6;
    e67.node2 = n7;
    
    e78 = [[Edge alloc]init];
    e78.node1 = n7;
    e78.node2 = n8;
    
    e85 = [[Edge alloc]init];
    e85.node1 = n8;
    e85.node2 = n5;
    
    e27 = [[Edge alloc]init];
    e27.node1 = n2;
    e27.node2 = n7;
    
    e58 = [[Edge alloc]init];
    e58.node1 = n5;
    e58.node2 = n8;
    
    [g addEdge:e12]; [g addEdge:e13];
    [g addEdge:e35]; [g addEdge:e14];
    [g addEdge:e46]; [g addEdge:e67];
    [g addEdge:e78]; [g addEdge:e85];
    [g addEdge:e27]; [g addEdge:e58];
    
    
    NSMutableArray *path = [MapViewController dijkstra:g from:n1 to:n5];
    if(!path){
        NSLog(@"path is nil !!!");
        return;
    }
    
    NSArray *expected = @[n1, n3, n5];
    
//    NSArray *a = @[@"1", @"2"];
//    NSArray *b = @[@"1", @"2"];
    
    
    //NSString *fmt = [NSString stringWithFormat:@"My formatted string: %@", anObject];
    
    //printf("%s", [fmt cStringUsingEncoding:[NSString defaultCStringEncoding]]);
    
    //XCTAssertEqual(a, b);

    XCTAssertTrue([path isEqual:expected]);


    
//    int i = 0;
//    int j = 0;
//    for (i in [path ]){
//        for(j ){
//            
//        
//        }
//        printf("x coordinate: %f\n", [cur XCoordinate]);
//    }
//    i = 0;
//    for (Node* cur in expected){
//        printf("x coordinate: %f\n", [cur XCoordinate]);
//    }
    
    
    //    XCTAssertEquals(a==b);
    //    path = [MapViewController dijkstra:g from:n1 to:n4];
    //    expected = @[n1, n3, n4];
    //    XCTAssertEqual(path, expected);
}



@end
