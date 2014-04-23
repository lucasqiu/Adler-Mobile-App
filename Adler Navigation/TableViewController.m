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
    
    if (self.dest) {
        self.destination.text = self.dest;
    }
    UITextField *src = (UITextField *)[self.view viewWithTag:1];
    UITextField *des = (UITextField *)[self.view viewWithTag:2];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:src];
    [arr addObject:des];
    for (int i=0;i<2;i++){
        UITextField *t = [arr objectAtIndex:i];
        t.layer.borderWidth = 1.5f;
        t.layer.borderColor = [[UIColor blackColor] CGColor];
    }
    UIButton *btn = (UIButton *)[self.view viewWithTag:3];
    btn.layer.borderWidth = 1.5f;
    btn.layer.cornerRadius = 9.0f;
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
            UIAlertView *navigateAlert = [[UIAlertView alloc] initWithTitle:@"Ummm.." message:@"\nPlease fill in both fields.\n\n"
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
