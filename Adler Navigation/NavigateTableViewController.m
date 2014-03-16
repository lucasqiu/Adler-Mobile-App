//
//  NavigateTableViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/16/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "NavigateTableViewController.h"
#import "MapGraph.h"
#import "Node.h"
#import "MapViewController.h"

@interface NavigateTableViewController ()

@end

@implementation NavigateTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    MapGraph * mg = [[MapGraph alloc] init];
    [mg createGraphFromFile:@"top.plist"];
    Node* pointA =  [mg getNodeById:_source];
    Node* pointB = [mg getNodeById:_destination];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    arr[0] = pointA;
    arr[1] = pointB;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
