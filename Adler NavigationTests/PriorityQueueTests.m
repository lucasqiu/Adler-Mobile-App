//
//  PriorityQueueTests.m
//  Adler Navigation
//
//  Created by Shi Qiu on 3/16/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PriorityQueue.h"
#import "Node.h"

@interface PriorityQueueTests : XCTestCase

@end

@implementation PriorityQueueTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testIsEmpty{
    PriorityQueue *pq = [[PriorityQueue alloc]init];
    XCTAssertTrue(pq.isEmpty==YES);
    
    Node* n1 = [[Node alloc] init];
    //Node* n2 = [[Node alloc] init];
    [pq addItem:n1 withPriority:8];
    //[pq addItem:n2 withPriority:8];
    XCTAssertTrue(pq.isEmpty==NO);
    
    Node *t1 = [pq getItemLeastPriority];
    XCTAssertTrue(pq.isEmpty==YES);
    //Node *t2 = [pq getItemLeastPriority];
    //XCTAssertTrue(t1==n1);
    //XCTAssertTrue(pq.isEmpty==YES);
}

- (void)testExample
{
    Node *n1, *n2, *n3, *n4;
    
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
    
    PriorityQueue * pq = [[PriorityQueue alloc]init];
    [pq addItem:n1 withPriority:8];
    [pq addItem:n2 withPriority:3];
    [pq addItem:n3 withPriority:2];
    [pq addItem:n4 withPriority:12];
    
    [pq printQueue];
    
    
    Node* t1 = (Node*)[pq getItemLeastPriority];
    Node* t2 = (Node*)[pq getItemLeastPriority];
    Node* t3 = (Node*)[pq getItemLeastPriority];
    Node* t4 = (Node*)[pq getItemLeastPriority];
    
    [pq printQueue];
    
    XCTAssertEqual(t1, n3);
    XCTAssertEqual(t2, n2);
    XCTAssertEqual(t3, n1);
    XCTAssertEqual(t4, n4);
    
    XCTAssertTrue(pq.isEmpty==YES);
    
    [pq addItem:n1 withPriority:8];
    [pq addItem:n2 withPriority:2];
    [pq addItem:n3 withPriority:2];
    [pq addItem:n4 withPriority:1];
    
    [pq printQueue];
    
    XCTAssertTrue(pq.isEmpty==NO);
    
    t1 = (Node*)[pq getItemLeastPriority];
    t2 = (Node*)[pq getItemLeastPriority];
    t3 = (Node*)[pq getItemLeastPriority];
    t4 = (Node*)[pq getItemLeastPriority];
    
    [pq printQueue];
    
    
    XCTAssertEqual(t1, n4);
    XCTAssertEqual(t2, n3);
    XCTAssertEqual(t3, n2);
    XCTAssertEqual(t4, n1);
    
    XCTAssertTrue(pq.isEmpty==YES);
}

@end
