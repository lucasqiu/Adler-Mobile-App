//
//  FloorViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "FloorViewController.h"
#import "EachFloorViewController.h"

@interface FloorViewController ()

@end

@implementation FloorViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //Retrieve information form each dictionary in array and display them in labels.
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Top Floor";
    }
    
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Mid Floor";
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"Lower Floor";
    }
    
    if (indexPath.row == 3) {
        cell.textLabel.text = @"Star";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"EachFloorView" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Sends data to the view controller to display details of the tapped individual.
    if ([[segue identifier] isEqualToString:@"EachFloorView"])
    {
        EachFloorViewController *ViewController = [segue destinationViewController];
        ViewController.sourceORdestination = _sourceORDestination;
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        if (myIndexPath.row == 0) {
            ViewController.data = @"top";
        }
        if (myIndexPath.row == 1) {
            ViewController.data = @"mid";
        }
        if (myIndexPath.row == 2) {
            ViewController.data = @"lower";
        }
        if (myIndexPath.row == 3) {
            ViewController.data = @"star";
        }
        
    }
}



@end
