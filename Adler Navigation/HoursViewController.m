//
//  HoursViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 4/10/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "HoursViewController.h"
#import "TableViewController.h"

@interface HoursViewController ()

@end

@implementation HoursViewController
@synthesize HoursView, ShowTimesView, FacilitiesView,showsTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:215.0/255 green:255.0/255 blue:240.0/255 alpha:1.0];
    [self displayHoursSegment];
    [self displayShowTimesSegment];
    
    _facilitiesTableViewItems = @[ @"Coat Check",
                             @"Exit",
                             @"Information",
                             @"Restrooms",
                             @"Lockers",
                             @"ATM",
                             @"Café Galileo's",
                             @"Adler Store"
                             ];
        
}

- (void) displayShowTimesSegment
{
    NSString *str=@"http://adlersiteserver.herokuapp.com/show_times";
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    NSDictionary * response=[NSJSONSerialization JSONObjectWithData:data options:
                             NSJSONReadingMutableContainers error:&error];
    _allShows = [response allKeys];
    _allTimings = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < [_allShows count]; i++) {
        NSArray * showTimes = [response objectForKey:[_allShows objectAtIndex:i]];
        NSString * allTimes = [[NSString alloc] init];
        for (int j = 0; j<[showTimes count]; j++) {
            NSDictionary * timing = [showTimes objectAtIndex:j];
            NSString * dateTime = [timing objectForKey:@"StartDateTime"];
            NSArray * time = [dateTime componentsSeparatedByString:@" "];
            NSMutableString * modifiedTime = [NSMutableString stringWithString:time[3]];
            [modifiedTime deleteCharactersInRange:NSMakeRange(5, 7)];
            
            if (j < ([showTimes count]) && j > 0) {
            allTimes = [allTimes stringByAppendingString:@", "];
            }
            
            allTimes = [allTimes stringByAppendingString:modifiedTime];
            
        }
        [_allTimings setValue:allTimes forKey:[_allShows objectAtIndex:i]];
    }

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_facilitiesTable]) {
        [self performSegueWithIdentifier:@"takeToFacility" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *myIndexPath = [self.facilitiesTable indexPathForSelectedRow];
    UITableViewCell *cell = [self.facilitiesTable cellForRowAtIndexPath:myIndexPath];
    NSString *str = cell.textLabel.text;
    
    if ([[segue identifier] isEqualToString:@"takeToFacility"]) {
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:showsTable]) {
        return [_allShows count];
    }
    
    else {
        return [_facilitiesTableViewItems count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:showsTable]) {
        
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString * shows = [_allShows objectAtIndex:indexPath.row];
    cell.textLabel.text = shows;
    NSString *timings = [_allTimings objectForKey:shows];
    cell.detailTextLabel.text = timings;
    return cell;
    }
    
    else {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text = _facilitiesTableViewItems[indexPath.row];
        return cell;

    }
}

- (void) displayHoursSegment
{
    NSString *str=@"http://adlersiteserver.herokuapp.com/open_hours";
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    NSDictionary * response=[NSJSONSerialization JSONObjectWithData:data options:
                             NSJSONReadingMutableContainers error:&error];
    
    NSArray * allKeys = [response allKeys];
    
    //stores the weekday and weekend timings formatted and ready to display.
    NSMutableArray * times = [[NSMutableArray alloc] init];
    
    //keeping message object out.
    for (int i = 0; i<[allKeys count] - 1; i++) {
        NSDictionary * open_close = [response objectForKey:allKeys[i]];
        NSDictionary * open = [open_close objectForKey:@"open"];
        NSDictionary * close = [open_close objectForKey:@"close"];
        
        NSNumber * hour_open = [open objectForKey:@"hour"];
        NSNumber * min_open = [open objectForKey:@"min"];
        
        NSNumber * hour_close = [close objectForKey:@"hour"];
        NSNumber * min_close = [close objectForKey:@"min"];
        
        int flagForPM = 0;
        
        int modifyHour;
        NSString * closingHour,*closingMin, *openingHour, *openingMin;
        
        
        /************* Opening Hour & Min ***************/
        if ([hour_open intValue] > 12) {
            modifyHour = [hour_open intValue] - 12;
            flagForPM = 1;
            
        }
        
        
        else
        {
            modifyHour = [hour_open intValue];
        }
        openingHour = [NSString stringWithFormat:@"%d", modifyHour];
        
        
        if ([min_open isEqualToNumber:[NSNumber numberWithInt:0]]) {
            openingMin = @"00";
        }
        else
        {
            openingMin = [min_open stringValue];
        }
        
        NSString * timings = [[NSString alloc] init];
        timings = [timings stringByAppendingString:openingHour];
        timings = [timings stringByAppendingString:@" : "];
        timings = [timings stringByAppendingString:openingMin];
        
        if (flagForPM) {
            timings = [timings stringByAppendingString:@" PM - "];
        }
        
        else {
            timings = [timings stringByAppendingString:@" AM - "];
        }
        
        
        flagForPM = 0;
        
        /*************** Closing Hour & Min *******************/
        if ([hour_close intValue] > 12) {
            modifyHour = [hour_close intValue] - 12;
            flagForPM = 1;
        }
        
        
        else
        {
            modifyHour = [hour_close intValue];
        }
        closingHour = [NSString stringWithFormat:@"%d", modifyHour];
        
        
        
        if ([min_close isEqualToNumber:[NSNumber numberWithInt:0]]) {
            closingMin = @"00";
        }
        else
        {
            closingMin = [min_close stringValue];
        }
        
        timings = [timings stringByAppendingString:closingHour];
        timings = [timings stringByAppendingString:@" : "];
        timings = [timings stringByAppendingString:closingMin];
        
        if (flagForPM) {
            timings = [timings stringByAppendingString:@" PM"];
        }
        
        else {
            timings = [timings stringByAppendingString:@" AM"];
        }
        [times addObject:timings];
        
    }
    
    
    _weekday.text = times[0];
    _weekend.text = times[1];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    long day = [comps weekday];
    
    if (day > 1 && day < 7) {
        _today.text = times[0];
    }
    else
    {
        _today.text = times[1];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.HoursView.hidden = NO;
            self.FacilitiesView.hidden = YES;
            self.ShowTimesView.hidden = YES;
            break;
            
        case 1:
            self.HoursView.hidden = YES;
            self.ShowTimesView.hidden = NO;
            self.FacilitiesView.hidden = YES;
            break;
            
        case 2:
            self.FacilitiesView.hidden = NO;
            self.ShowTimesView.hidden = YES;
            self.HoursView.hidden = YES;
            
        default:
            break;
    }
}
@end
