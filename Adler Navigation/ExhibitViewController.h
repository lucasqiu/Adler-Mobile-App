//
//  ExhibitViewController.h
//  Adler Navigation
//
//  Created by Shi Qiu on 4/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exhibit.h"
#import "ImageViewController.h"

@interface ExhibitViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *exhibits;
@property NSMutableArray *displayed;
@end


@interface ViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@end