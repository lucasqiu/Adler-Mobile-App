//
//  HoursViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 4/10/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoursViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *today;

@property (strong, nonatomic) IBOutlet UILabel *weekday;
@property (strong, nonatomic) IBOutlet UILabel *weekend;
@property (strong, nonatomic) IBOutlet UITableView *showsTable;
@property (strong, nonatomic) IBOutlet UITableView *facilitiesTable;

@property (strong, nonatomic) IBOutlet UIView *HoursView;
@property (strong, nonatomic) IBOutlet UIView *ShowTimesView;
@property (strong, nonatomic) IBOutlet UIView *FacilitiesView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (strong, nonatomic) NSArray * allShows;
@property (strong, nonatomic) NSMutableDictionary * allTimings;
@property (strong, nonatomic) NSArray * facilitiesTableViewItems;

- (IBAction)segmentedValueChanged:(id)sender;

- (void) displayHoursSegment;
- (void) displayShowTimesSegment;
- (NSString*) findNearestBathroom;

@end
