//
//  TableViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "TableViewController.h"
#import "FloorViewController.h"
#import "EachFloorViewController.h"
#import "NavigateTableViewController.h"
#import "MapGraph.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[_giveDirections setEnabled:NO];
    self.source.delegate = self;
    self.destination.delegate = self;
    self.view.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
    
    if (self.dest) {
        self.destination.text = self.dest;
    }
}

- (IBAction)editingChanged {
    if ([_source.text length] != 0 && [_destination.text length] != 0) {
        [_giveDirections setEnabled:YES];
    }
    else {
        [_giveDirections setEnabled:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textFieldDidBeginEditing:(UITextField *)input{
    
    [input resignFirstResponder];
    
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"Navigate"]){
        if ([_source.text isEqualToString:@""]||[_destination.text isEqualToString:@""]){
            UIAlertView *navigateAlert = [[UIAlertView alloc] initWithTitle:@"Navigation Error" message:@"Please fill in both fields."
                                            delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                                          otherButtonTitles:NSLocalizedString(@"OK",nil), nil];
            [navigateAlert setTransform:CGAffineTransformMakeTranslation(0,109)];
            [navigateAlert show];
            return NO;
        }
    }
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FloorViewController *fv = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"SourceTableView"])
    {
        fv.sourceORDestination = @"1";
        
    }
    else if ([[segue identifier] isEqualToString:@"DestinationTableView"])
    {
        fv.sourceORDestination = @"2";
    }
    
    else if ([[segue identifier] isEqualToString:@"Navigate"])
    {
        NavigateTableViewController * navigate = [segue destinationViewController];

        navigate.source = _source.text;
        navigate.destination = _destination.text;
    }
}


- (IBAction)sourceUnwindToViewController:(UIStoryboardSegue *)sourceUnwindSegue
{
    _source.text = _data;
}

- (IBAction)destinationUnwindToViewController:(UIStoryboardSegue *)destinationUnwindSegue
{
    _destination.text = _data;
}

@end
