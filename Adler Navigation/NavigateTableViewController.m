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
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"top" ofType:@"plist"];
    [mg createGraphFromFile:filePath];
    Node* pointA =  [mg getNodeById:_source];
    Node* pointB = [mg getNodeById:_destination];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    
    MapViewController * mv = [[MapViewController alloc] init];
    arr = [mv dijkstra:mg from:pointA to:pointB];
    
    UIImage * image = [UIImage imageNamed:@"top.png"];
    _path.image = [mv nextDirection:arr image:image];
    
   
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
