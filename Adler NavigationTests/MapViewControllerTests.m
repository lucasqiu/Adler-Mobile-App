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
    
    Node *n4 = [[Node alloc] init];
    
    NSArray *path = @[n1, n2, n3];
    
    [MapViewController nextDirection:path];
}

@end
