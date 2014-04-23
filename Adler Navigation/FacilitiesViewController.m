//
//  FacilitiesViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "FacilitiesViewController.h"
#import "TableViewController.h"

@interface FacilitiesViewController ()

/// List of items to be displayed in this view's table.
@property NSArray *tableViewItems;

@end

@implementation FacilitiesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
    // Listed in the order they appear in the table view.
    self.tableViewItems = @[ @"Coat Check",
                             @"Exit",
                             @"Information",
                             @"Restrooms",
                             @"Lockers",
                             @"ATM",
                             @"Café Galileo's",
                             @"Adler Store"
                             ];

    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"facilitiesBackground.png"]];
    self.tableView.backgroundView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.tableViewItems.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.alpha = .9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Retrieve information from each dictionary in array and display them in labels.
    
    cell.textLabel.text = self.tableViewItems[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ToNavigationView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:myIndexPath];
    NSString *str = cell.textLabel.text;
    
    if ([[segue identifier] isEqualToString:@"ToNavigationView"]) {
        if ([str isEqualToString:@"ATM"]) {
            // Closest node to the acual position of the ATMs?
            // TODO: add a new node for ATM
            str = @"Café Galileo's";
        }
        else if ([str isEqualToString:@"Lockers"]) {
            // TODO: add a new node for lockers
            str = @"travel10";
        }
        TableViewController *viewController = [segue destinationViewController];
        viewController.dest = str;
    }
}

@end
