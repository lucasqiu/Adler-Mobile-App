//
//  HomeViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize aboutTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    aboutTableView.backgroundColor = [UIColor clearColor];
    _HomeImage.image = [UIImage imageNamed:@"home2.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"About Us";
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"About Adler";
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"How to use this app";
    }
    
    if (indexPath.row == 3) {
        cell.textLabel.text = @"Adler Website";
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    return cell;
}



@end
