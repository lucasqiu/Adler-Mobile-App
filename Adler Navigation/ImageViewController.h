//
//  ImageViewController.h
//  Adler Navigation
//
//  Created by Shi Qiu on 4/20/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exhibit.h"
#import "TableViewController.h"



@interface ImageViewController : UIViewController


@property NSMutableArray *exhibits;
@property (weak, nonatomic) Exhibit* curExhibit;

@property (weak, nonatomic) IBOutlet UILabel *exhibitName;
@property (weak, nonatomic) IBOutlet UIImageView *display;
@property (weak, nonatomic) IBOutlet UITextView *longDetails;

- (IBAction)toNavigate:(id)sender;
- (void) setCurrentExhibit:(Exhibit*)value;
@end
