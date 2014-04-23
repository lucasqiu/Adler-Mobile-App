//
//  EachFloorViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "EachFloorViewController.h"
#import "TableViewController.h"

@interface EachFloorViewController ()

@end

@implementation EachFloorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray * exhibits = [[NSArray alloc] init];
    _exhibits_to_display = [[NSMutableArray alloc] init];

    NSString *myPlistFilePath = [[NSBundle mainBundle] pathForResource: @"map_data_all" ofType: @"plist"];
    exhibits = [NSArray arrayWithContentsOfFile: myPlistFilePath];
    
        int counter = 0;
        for (int i = 0; i < [exhibits count]; i++) {
            BOOL checkIfSourceOrDestination = [[exhibits[i] objectForKey:@"isSourceOrDestination"] boolValue];
            NSString * checkForFloor = [exhibits[i] objectForKey:@"floor"];
            if ([checkForFloor isEqualToString:_currentFloor]) {
                if (checkIfSourceOrDestination) {
                    _exhibits_to_display[counter] = [exhibits[i] objectForKey:@"uid"];
                    counter++;
                }
            }
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.exhibits_to_display count];
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
    NSString * exhibits = [self.exhibits_to_display objectAtIndex:indexPath.row];
    cell.textLabel.text = exhibits;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    if ([_sourceORdestination isEqualToString:@"1"])
    {
        [self performSegueWithIdentifier:@"source" sender:self];
    }
    else if ([_sourceORdestination isEqualToString:@"2"])
    {
        [self performSegueWithIdentifier:@"destination" sender:self];
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"source"])
    {
        TableViewController *ViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:myIndexPath];
        NSString *str = cell.textLabel.text;
        ViewController.data = str;
    }
    
    //Sends data to the view controller to display details of the tapped individual.
    if ([[segue identifier] isEqualToString:@"destination"])
    {
        TableViewController *ViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:myIndexPath];
        NSString *str = cell.textLabel.text;
        ViewController.data = str;
    }
}

@end
