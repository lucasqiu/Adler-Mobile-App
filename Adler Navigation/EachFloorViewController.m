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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"%@", _data);
    NSArray * exhibits = [[NSArray alloc] init];
    _exhibits_to_display = [[NSMutableArray alloc] init];
    if ([_data  isEqual: @"Top Floor"]) {
        NSString *myPlistFilePath = [[NSBundle mainBundle] pathForResource: @"top" ofType: @"plist"];
        exhibits = [NSArray arrayWithContentsOfFile: myPlistFilePath];
    }
    
    else if ([_data  isEqual: @"Mid Floor"]) {
        NSString *myPlistFilePath = [[NSBundle mainBundle] pathForResource: @"mid" ofType: @"plist"];
        exhibits = [NSArray arrayWithContentsOfFile: myPlistFilePath];
    }
    
    else if ([_data  isEqual: @"Lower Floor"]) {
        NSString *myPlistFilePath = [[NSBundle mainBundle] pathForResource: @"lower" ofType: @"plist"];
        exhibits = [NSArray arrayWithContentsOfFile: myPlistFilePath];
    }
    
    else if ([_data  isEqual: @"Star"]) {
        NSString *myPlistFilePath = [[NSBundle mainBundle] pathForResource: @"star" ofType: @"plist"];
        exhibits = [NSArray arrayWithContentsOfFile: myPlistFilePath];
    }



    
        int counter = 0;
        for (int i = 0; i < [exhibits count]; i++) {
            NSString * checkToDisplay = [exhibits[i] objectForKey:@"uid"];
            if ([checkToDisplay rangeOfString:@"exit"].location == NSNotFound && [checkToDisplay rangeOfString:@"travel"].location == NSNotFound && [checkToDisplay rangeOfString:@"enter"].location == NSNotFound) {
                _exhibits_to_display[counter] = checkToDisplay;
                counter++;
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
