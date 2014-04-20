//
//  ImageViewController.h
//  Adler Navigation
//
//  Created by Shi Qiu on 4/20/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property NSUInteger pageIndex;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
