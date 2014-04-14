//
//  FacilitiesViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "FacilitiesViewController.h"

@interface FacilitiesViewController ()

@property NSArray *tableViewItems;

@end

@implementation FacilitiesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableViewItems = @[ @"Coat Check",
                         @"Exit",
                         @"Information",
                         @"Restrooms",
                         @"Lockers",
                         @"ATM",
                         @"Café",
                         @"Store"
                         ];
    
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to preserve selection between presentations.
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _tableViewItems.count;
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
    
    cell.textLabel.text = _tableViewItems[indexPath.row];
    
    return cell;
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"FloorView" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Sends data to the view controller to display details of the tapped individual.
    if ([[segue identifier] isEqualToString:@"FloorView"])
    {
        
    }
}*/

@end
