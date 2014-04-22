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
        //self.display.image = self.curExhibit.images[0];

        self.longDetails.editable = NO;
        if (self.curExhibit){
            self.longDetails.text = self.curExhibit.description;
            self.display.image = self.curExhibit.images[0];
        }
    }
    else{
        NSLog(@"nil exhibit passed");
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
    // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"NavigateToExhibit"]) {
        TableViewController *tc = [segue destinationViewController];
        tc.dest = _curExhibit.ID;
    }
}


@end
