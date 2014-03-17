//
//  PriorityQueueTests.m
//  Adler Navigation
//
//  Created by Shi Qiu on 3/16/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PriorityQueue.h"
#import "MapGraph.h"
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

- (void)testExample
{
    PriorityQueue * pq1 = [[PriorityQueue alloc]init];
    NSLog([pq1 isEmpty] ? @"Yes" : @"No");
    
    Node * n1 = [[Node alloc]init];
    Node * n2 = [[Node alloc]init];
    Node * n3 = [[Node alloc]init];
    Node * n4 = [[Node alloc]init];
    Node * n5 = [[Node alloc]init];
    [pq1 addItem:n1 withPriority:8];
    [pq1 addItem:n2 withPriority:5];
    [pq1 addItem:n3 withPriority:2];
    [pq1 addItem:n4 withPriority:43];
    [pq1 addItem:n5 withPriority:7];
    
    NSLog([pq1 isEmpty] ? @"Yes" : @"No");
    
    if(n3 == [pq1 getItemLeastPriority]){
        NSLog(@"right!");
    }
    else{
        NSLog(@"wrong!!");
    }
    
    if(n2 == [pq1 getItemLeastPriority]){
        NSLog(@"right!");
    }
    else{
        NSLog(@"wrong!!");
    }

    if(n5 == [pq1 getItemLeastPriority]){
        NSLog(@"right!");
    }
    else{
        NSLog(@"wrong!!");
    }

    if(n1 == [pq1 getItemLeastPriority]){
        NSLog(@"right!");
    }
    else{
        NSLog(@"wrong!!");
    }
    
    if(n4 == [pq1 getItemLeastPriority]){
        NSLog(@"right!");
    }
    else{
        NSLog(@"wrong!!");
    }

    
    NSLog([pq1 isEmpty] ? @"Yes" : @"No");
    
}

@end
