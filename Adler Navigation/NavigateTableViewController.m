//
//  NavigateTableViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/16/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "NavigateTableViewController.h"
#import "MapGraph.h"
#import "Node.h"

@interface NavigateTableViewController ()

@end

@implementation NavigateTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MapGraph * mg = [[MapGraph alloc] init];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"map_data_all" ofType:@"plist"];
    [mg createGraphFromFile:filePath];
    Node* pointA =  [mg getNodeById:_source];
    Node* pointB = [mg getNodeById:_destination];
    _arr = [[NSMutableArray alloc] init];
    
    _arr = [MapViewController dijkstra:mg from:pointA to:pointB];
    for (int i = 0; i < [_arr count]; i++) {
        Node * n = [_arr objectAtIndex:i];
        NSLog(@"%@", n.id);
    }
    
    self.nextImage.maximumValue = ([_arr count] - 2);
    
    Node * n1 = [_arr objectAtIndex:0];
    
    Node * n2 = [_arr objectAtIndex:1];
    
    // Get the pdf image of the current floor. TODO: change "top" to n1.floor
    NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:@"top" ofType: @"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
    CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
    _page = CGPDFDocumentGetPage(document, 1);
    
    NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2 onPDF:_page];
    
    [_path loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    NSUInteger value = sender.value;
    Node * n1 = [_arr objectAtIndex:value];
    Node * n2 = [_arr objectAtIndex:value+1];
    NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2  onPDF:_page];
    
    [_path loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}

@end
