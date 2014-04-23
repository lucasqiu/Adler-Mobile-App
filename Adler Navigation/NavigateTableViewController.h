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
@property (strong, nonatomic) NSMutableArray * path;
@property (strong, nonatomic) MapGraph *mg;
@property (strong, nonatomic) IBOutlet UIWebView *view1;
@property (strong, nonatomic) IBOutlet UIWebView *view2;
@property (strong, nonatomic) IBOutlet UIStepper *nextImage;
@property (nonatomic) CGPDFPageRef page;
@property (strong, nonatomic) Node *n1;
@property (strong, nonatomic) Node *n2;

//label to display the direction in text form.
@property (strong, nonatomic) IBOutlet UILabel *textDirection;

- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
