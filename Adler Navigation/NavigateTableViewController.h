//
//  NavigateTableViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 3/16/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"


@interface NavigateTableViewController : UIViewController
@property (strong, nonatomic) NSString * source;
@property (strong, nonatomic) NSString * destination;
@property (strong, nonatomic) NSMutableArray * arr;
@property (strong, nonatomic) IBOutlet UIImageView *path;
@property (strong, nonatomic) IBOutlet UIStepper *nextImage;

- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
