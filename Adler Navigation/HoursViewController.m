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
@synthesize HoursView, ShowTimesView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str=@"http://adlersiteserver.herokuapp.com/open_hours";
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    id response=[NSJSONSerialization JSONObjectWithData:data options:
                 NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@", response);
    
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
