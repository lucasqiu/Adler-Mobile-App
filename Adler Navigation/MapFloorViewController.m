//
//  MapFloorViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "MapFloorViewController.h"
#import "EachMapViewController.h"

@interface MapFloorViewController ()

/// List of choices for the map level to view.
@property NSArray *levelChoices;

@end

@implementation MapFloorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Listed in order of appearance in the table view.
    _levelChoices = @[ @"Upper Level",
                       @"Mid Level",
                       @"Lower Level",
                       @"Star Level"
                       ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _levelChoices.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //Retrieve information form each dictionary in array and display them in labels.
    
    cell.textLabel.text = _levelChoices[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"DisplayMap" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Sends data to the view controller to display details of the tapped individual.
    if ([[segue identifier] isEqualToString:@"DisplayMap"])
    {
        EachMapViewController *ViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        ViewController.levelToDisplay = _levelChoices[myIndexPath.row];
    }
}


@end
