//
//  ImageViewController.m
//  Adler Navigation
//
//  Created by Shi Qiu on 4/20/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.curExhibit){
        self.longDetails.editable = NO;
        self.longDetails.text = self.curExhibit.description;
        self.display.image = self.curExhibit.images[0];
        if ([self.curExhibit.ID isEqualToString: @"Hidden Wonders"]||
            [self.curExhibit.ID isEqualToString: @"Sundials"]){
            _naviButton.hidden = YES;
        }
    }
}



- (IBAction)toNavigate:(id)sender {
}

- (void) setCurrentExhibit:(Exhibit*)value {
    _curExhibit = value;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NavigateToExhibit"]) {
        TableViewController *tc = [segue destinationViewController];
        NSString *str = _curExhibit.ID;
        tc.dest = str;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    UITextView *tv = self.longDetails;
    tv.backgroundColor = [UIColor blackColor];
    tv.textColor = [UIColor whiteColor];
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:100];
    //UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blackColor];
}

@end
