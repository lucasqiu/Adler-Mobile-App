//
//  ExhibitViewController.m
//  Adler Navigation
//
//  Created by Shi Qiu on 4/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "ExhibitViewController.h"

@interface ExhibitViewController ()

@end

@implementation ExhibitViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _exhibits = [NSMutableArray arrayWithCapacity:10];
    _displayed = [NSMutableArray arrayWithCapacity:10];
    
    Exhibit *exh1 = [[Exhibit alloc] init];
    exh1.ID = @"Astronomy in Culture";
    exh1.description = @"Go back in history and learn from ancient Egypt to medieval Europe.";
    exh1.images = [[NSMutableArray alloc] init];
    UIImage *img1 = [UIImage imageNamed:@"img0.jpg"];
    [exh1.images addObject:img1];
    exh1.displayed = false;
    [_exhibits addObject:exh1];
    
    
    Exhibit *exh2 = [[Exhibit alloc] init];
    exh2.ID = @"Sundials";
    exh2.description = @"Collecting and Conserving Sundials focuses on themes of consumers, collecting, and conservation.";
    exh2.images = [[NSMutableArray alloc] init];
    UIImage *img2 = [UIImage imageNamed:@"img1.jpg"];
    [exh2.images addObject:img2];
    exh2.displayed = false;
    [_exhibits addObject:exh2];
    
    Exhibit *exh3 = [[Exhibit alloc] init];
    exh3.ID = @"Our Solar System";
    exh3.description = @"Explore the many worlds — planets, moons, dwarf planets, comets, and asteroids.";
    exh3.images = [[NSMutableArray alloc] init];
    UIImage *img3 = [UIImage imageNamed:@"img5.jpg"];
    [exh3.images addObject:img3];
    exh3.displayed = false;
    [_exhibits addObject:exh3];
    
    
    
    //    Exhibit *exh2 = [[Exhibit alloc] init];
    //    exh2.ID = @"ClarkFamilyWelcomeGallery";
    //    exh2.description = @"It is cool.";
    //    exh2.images = [NSArray arrayWithObjects:@"Aston Martin",
    //                   @"Lotus", @"Jaguar", @"Bentley", nil]; ;
    //    [_exhibits addObject:exh2];
    //
    //    Exhibit *exh3 = [[Exhibit alloc] init];
    //    exh3.ID = @"Cyberspace";
    //    exh3.description = @"It is cool.";
    //    exh3.images = [NSArray arrayWithObjects:@"Aston Martin",
    //                   @"Lotus", @"Jaguar", @"Bentley", nil]; ;
    //    [_exhibits addObject:exh3];
    //
    //    Exhibit *exh4 = [[Exhibit alloc] init];
    //    exh4.ID = @"HiddenWonders";
    //    exh4.description = @"It is cool.";
    //    exh4.images = [NSArray arrayWithObjects:@"Aston Martin",
    //                   @"Lotus", @"Jaguar", @"Bentley", nil]; ;
    //    [_exhibits addObject:exh4];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.exhibits count];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"av" forIndexPath:indexPath];
    
    Exhibit *exhibit = (self.exhibits)[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell1 viewWithTag:100];
    nameLabel.text = exhibit.ID;
    UITextView *t = (UITextView *)[cell1 viewWithTag:105];
    t.text = exhibit.description;
    
    UIImageView *imageView = (UIImageView *)[cell1 viewWithTag:110];
    imageView.image = exhibit.images[0];

    
    return cell1;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
