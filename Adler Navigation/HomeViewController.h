//
//  HomeViewController.h
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *HomeImage;
@property (weak, nonatomic) IBOutlet UIButton *tutorial;

@property (strong, nonatomic) IBOutlet UITableView *aboutTableView;

@end
