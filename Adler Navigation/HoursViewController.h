//
//  HoursViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 4/10/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoursViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *HoursView;
@property (strong, nonatomic) IBOutlet UIView *ShowTimesView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedValueChanged:(id)sender;

@end
