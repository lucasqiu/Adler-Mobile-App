//
//  TableViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *source;
@property (strong, nonatomic) IBOutlet UITextField *destination;
@property (strong, nonatomic) NSString * data;
@end
