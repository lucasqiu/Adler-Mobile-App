//
//  EachFloorViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EachFloorViewController : UITableViewController
@property (strong, nonatomic) NSString * data;
@property (strong, nonatomic) NSString * sourceORdestination;
@property (strong, nonatomic) NSMutableArray * exhibits_to_display;
@end
