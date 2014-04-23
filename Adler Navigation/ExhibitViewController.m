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
    
    _exhibits = [NSMutableArray arrayWithCapacity:20];
    UIImage *img;
    NSString* path;
    NSArray *ex = @[@"ast", @"cla", @"cyb", @"hid", @"hist", @"solar", @"pe", \
                    @"sund", @"tele", @"sfm", @"unv"];
    
    NSUInteger arrayLength = [ex count];
    for(int i=0; i< arrayLength; i++){
        Exhibit *exh = [[Exhibit alloc] init];
        NSMutableString *prefix = [[ex  objectAtIndex:i] mutableCopy];
        
        NSMutableString *name = [prefix mutableCopy];
        [name appendString:@"_name"];
        path = [[NSBundle mainBundle] pathForResource:name
                                               ofType:@"txt"];
        exh.ID = [NSString stringWithContentsOfFile:path
                                                    encoding:NSUTF8StringEncoding
                                                       error:NULL];
        NSMutableString *shortdes = [prefix mutableCopy];
        [shortdes appendString:@"_short"];
        path = [[NSBundle mainBundle] pathForResource:shortdes
                                               ofType:@"txt"];
        exh.description = [NSString stringWithContentsOfFile:path
                                                     encoding:NSUTF8StringEncoding
                                                        error:NULL];
        exh.images = [[NSMutableArray alloc] init];
        for (int j=0; j<10; j++){
            NSMutableString *imgname = [prefix mutableCopy];
            [imgname appendString:[@(j) stringValue]];
            [imgname appendString:@".png"];
            if ([UIImage imageNamed:imgname] != NULL){
                img = [UIImage imageNamed:imgname];
                [exh.images addObject:img];
            }
            imgname = [prefix mutableCopy];
            [imgname appendString:[@(j) stringValue]];
            [imgname appendString:@".jpg"];
            if ([UIImage imageNamed:imgname] != NULL){
                img = [UIImage imageNamed:imgname];
                [exh.images addObject:img];
            }
        }
        [_exhibits addObject:exh];
    }
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
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
    
    Exhibit *exhibit = (self.exhibits)[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = exhibit.ID;
    UITextView *t = (UITextView *)[cell viewWithTag:105];
    t.text = exhibit.description;
    t.editable = NO;
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:110];
    if (exhibit.images == NULL){
    }
    else if ( [exhibit.images count] == 0){
    }
    else{ imageView.image = exhibit.images[0];}
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewExhibitDetail"]) {
        
        NSLog(@"in prepare for segue   .");
        
        ImageViewController *vc = [segue destinationViewController];
        vc.exhibits = _exhibits;;
        
        if(!vc.exhibits){
            NSLog(@"exhibits nil");
        }
        
        //self.imageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
        //self.imageViewController.exhibits = _exhibits;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Exhibit *exhibit = (self.exhibits)[indexPath.row];
        [vc setCurrentExhibit:exhibit];
    }
}


@end
