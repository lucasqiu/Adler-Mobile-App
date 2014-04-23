//
//  HoursViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 4/10/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "HoursViewController.h"

@interface HoursViewController ()

@end

@implementation HoursViewController
@synthesize HoursView, ShowTimesView, showsTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.HoursView.hidden = NO;
            self.ShowTimesView.hidden = YES;
            break;
            
        case 1:
            self.HoursView.hidden = YES;
            self.ShowTimesView.hidden = NO;
            
        default:
            break;
    }
}
@end
