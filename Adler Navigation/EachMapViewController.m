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

    _Floor.text = _levelToDisplay;
    NSString *myPdfFilePath;
    if ([_levelToDisplay  isEqual: @"Upper Level"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"top" ofType: @"pdf"];
    }
    
    else if ([_levelToDisplay  isEqual: @"Mid Level"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"mid" ofType: @"pdf"];
    }
    
    else if ([_levelToDisplay  isEqual: @"Lower Level"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"lower" ofType: @"pdf"];
    }
    
    else if ([_levelToDisplay  isEqual: @"Star Level"]) {
        myPdfFilePath = [[NSBundle mainBundle] pathForResource: @"star" ofType: @"pdf"];
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
