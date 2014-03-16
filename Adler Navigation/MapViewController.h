//
//  MapViewController.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/22/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)nextDirection:(NSMutableArray *)path;

@end
