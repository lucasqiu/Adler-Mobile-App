//
//  EachMapViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "EachMapViewController.h"

@interface EachMapViewController ()

@end

@implementation EachMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _Floor.text = _data;
    NSString *myPdfFilePath;
    if ([_data  isEqual: @"Top Floor"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"Map_stack_tabloid_top" ofType: @"pdf"];
    }
    
    else if ([_data  isEqual: @"Mid Floor"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"Map_stack_tabloid_mid" ofType: @"pdf"];
    }
    
    else if ([_data  isEqual: @"Lower Floor"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"Map_stack_tabloid_lower" ofType: @"pdf"];
    }
    
    else if ([_data  isEqual: @"Star"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"Map_stack_tabloid_star" ofType: @"pdf"];
    }
    
    NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    
    [_FloorMap loadRequest:request];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
