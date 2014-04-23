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
    aboutTableView.backgroundColor = [UIColor clearColor];
    _HomeImage.image = [UIImage imageNamed:@"home2.png"];
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:100];
    btn.backgroundColor = [UIColor clearColor];
    btn.layer.borderWidth = 1.5f;
    btn.layer.borderColor = [[UIColor whiteColor] CGColor];
    btn.layer.cornerRadius = 10.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"How to use the app";
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    return cell;
}



@end
