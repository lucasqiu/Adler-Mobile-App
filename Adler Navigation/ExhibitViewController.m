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
    
    _exhibits = [NSMutableArray arrayWithCapacity:50];
    UIImage *img;
    NSString* path;
    
    Exhibit *exh1 = [[Exhibit alloc] init];
    exh1.ID = @"Astronomy in Culture";
    path = [[NSBundle mainBundle] pathForResource:@"ast_short"
                                                     ofType:@"txt"];
    exh1.description = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                    error:NULL];
    exh1.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"ast0.jpg"];
    [exh1.images addObject:img];
    [_exhibits addObject:exh1];
    
    Exhibit *exh2 = [[Exhibit alloc] init];
    exh2.ID = @"ClarkFamilyWelcomeGallery";
    path = [[NSBundle mainBundle] pathForResource:@"cla_short"
                                           ofType:@"txt"];
    exh2.description = [NSString stringWithContentsOfFile:path
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
    exh2.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"cla0.jpg"];
    [exh2.images addObject:img];
    [_exhibits addObject:exh2];
    
    Exhibit *exh3 = [[Exhibit alloc] init];
    exh3.ID = @"CyberSpace";
    path = [[NSBundle mainBundle] pathForResource:@"cyb_short"
                                           ofType:@"txt"];
    exh3.description = [NSString stringWithContentsOfFile:path
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
    exh3.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"cyb0.jpg"];
    [exh3.images addObject:img];
    [_exhibits addObject:exh3];
    
    Exhibit *exh4 = [[Exhibit alloc] init];
    exh4.ID = @"HiddenWonders";
    path = [[NSBundle mainBundle] pathForResource:@"hid_short"
                                           ofType:@"txt"];
    exh4.description = [NSString stringWithContentsOfFile:path
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
    exh4.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"hid0.jpg"];
    [exh4.images addObject:img];
    [_exhibits addObject:exh4];
    
    Exhibit *exh5 = [[Exhibit alloc] init];
    exh5.ID = @"HistoricAtwoodSphere";
    exh5.description = @"lalala.";
    exh5.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"hist0.png"];
    [exh5.images addObject:img];
    [_exhibits addObject:exh5];
    
    Exhibit *exh6 = [[Exhibit alloc] init];
    exh6.ID = @"OurSolarSystem";
    exh6.description = @"lalala.";
    exh6.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"solar0.png"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar1.jpg"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar2.jpg"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar3.jpg"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar4.jpg"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar5.jpg"];
    [exh6.images addObject:img];
    img = [UIImage imageNamed:@"solar6.jpg"];
    [exh6.images addObject:img];
    [_exhibits addObject:exh6];
    
    Exhibit *exh7 = [[Exhibit alloc] init];
    exh7.ID = @"PlanetExplorers";
    exh7.description = @"lalala.";
    exh7.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"pe0.png"];
    [exh7.images addObject:img];
    [_exhibits addObject:exh7];
    
    Exhibit *exh8 = [[Exhibit alloc] init];
    exh8.ID = @"ShootForTheMoon";
    exh8.description = @"lalala.";
    exh8.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"sfm0.png"];
    [exh8.images addObject:img];
    [_exhibits addObject:exh8];
    
    Exhibit *exh9 = [[Exhibit alloc] init];
    exh9.ID = @"Sundials";
    exh9.description = @"Collecting and Conserving Sundials focuses on themes \
    of consumers, collecting, and conservation.";
    exh9.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"sund0.jpg"];
    [exh9.images addObject:img];
    img = [UIImage imageNamed:@"sund1.jpg"];
    [exh9.images addObject:img];
    img = [UIImage imageNamed:@"sund2.jpg"];
    [exh9.images addObject:img];
    img = [UIImage imageNamed:@"sund3.jpg"];
    [exh9.images addObject:img];
    img = [UIImage imageNamed:@"sund4.jpg"];
    [exh9.images addObject:img];
    [_exhibits addObject:exh9];
    
    Exhibit *exh10 = [[Exhibit alloc] init];
    exh10.ID = @"Telescope";
    exh10.description = @"lalala.";
    exh10.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"tele0.png"];
    [exh10.images addObject:img];
    [_exhibits addObject:exh10];

    Exhibit *exh11 = [[Exhibit alloc] init];
    exh11.ID = @"TheUniverse";
    exh11.description = @"lalala.";
    exh11.images = [[NSMutableArray alloc] init];
    img = [UIImage imageNamed:@"unv0.png"];
    [exh11.images addObject:img];
    [_exhibits addObject:exh11];
    
    
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
    
    
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"ExhibitCell" forIndexPath:indexPath];
    
    Exhibit *exhibit = (self.exhibits)[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell1 viewWithTag:100];
    nameLabel.text = exhibit.ID;
    UITextView *t = (UITextView *)[cell1 viewWithTag:105];
    t.text = exhibit.description;
    t.editable = NO;
    
    UIImageView *imageView = (UIImageView *)[cell1 viewWithTag:110];
    if (exhibit.images == NULL){
    }
    else if ( [exhibit.images count] == 0){
    }
    else{ imageView.image = exhibit.images[0];}

    
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
