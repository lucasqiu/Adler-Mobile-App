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
    [_path2 setHidden:YES];
    
    [_nextImage setTintColor:[UIColor blueColor]];
    [_nextImage setIncrementImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_nextImage setDecrementImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];

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
    
    NSInteger sourceFloorLevel = 0;
    NSInteger destinationFloorLevel = 0;
    
    if ([n1.floor isEqualToString:n2.floor]) {
        // Get the pdf image of the current floor. TODO: change "top" to n1.floor
        NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:n1.floor ofType: @"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
        CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
        _page = CGPDFDocumentGetPage(document, 1);
        
        NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2 onPDF:_page];
        
        [_path loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];

    }
    
    else{
        if ([n1.floor isEqualToString:@"top"]) {
            sourceFloorLevel = 1;
        }
        else if ([n1.floor isEqualToString:@"mid"])
        {
            sourceFloorLevel = 2;
        }
        else if ([n1.floor isEqualToString:@"lower"])
        {
            sourceFloorLevel = 3;
        }
        else if ([n1.floor isEqualToString:@"star"])
        {
            sourceFloorLevel = 3;
        }
        
        if ([n2.floor isEqualToString:@"top"]) {
            destinationFloorLevel = 1;
        }
        else if ([n2.floor isEqualToString:@"mid"])
        {
            destinationFloorLevel = 2;
        }
        else if ([n2.floor isEqualToString:@"lower"])
        {
            destinationFloorLevel = 3;
        }
        else if ([n2.floor isEqualToString:@"star"])
        {
            destinationFloorLevel = 3;
        }
        
        if ((sourceFloorLevel - destinationFloorLevel) < 0) {
            NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:@"downstairs" ofType: @"pdf"];
            NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
            CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
            _page = CGPDFDocumentGetPage(document, 1);
            
            NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2 onPDF:_page];
            
            [_path loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
            

        }
        
        else{
            NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:@"upstairs" ofType: @"pdf"];
            NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
            CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
            _page = CGPDFDocumentGetPage(document, 1);
            
            NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2 onPDF:_page];
            
            [_path loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
            

        }

             
    }
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
    
    UIWebView * __strong *nextPath;
    if ([_path isHidden]) {
        nextPath = &_path;
    } else {
        nextPath = &_path2;
    }
    
    if ([n1.floor isEqualToString:n2.floor]) {
        NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:n1.floor ofType: @"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
        CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
        _page = CGPDFDocumentGetPage(document, 1);
        
        NSData * data = [MapViewController drawPathFromSource:n1 Destination:n2 onPDF:_page];
        
        [*nextPath loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
    }
    else {
        NSInteger sourceFloorLevel = 0;
        NSInteger destinationFloorLevel = 0;
        
        if ([n1.floor isEqualToString:@"top"]) {
            sourceFloorLevel = 1;
        }
        else if ([n1.floor isEqualToString:@"mid"])
        {
            sourceFloorLevel = 2;
        }
        else if ([n1.floor isEqualToString:@"lower"])
        {
            sourceFloorLevel = 3;
        }
        else if ([n1.floor isEqualToString:@"star"])
        {
            sourceFloorLevel = 4;
        }
        
        if ([n2.floor isEqualToString:@"top"]) {
            destinationFloorLevel = 1;
        }
        else if ([n2.floor isEqualToString:@"mid"])
        {
            destinationFloorLevel = 2;
        }
        else if ([n2.floor isEqualToString:@"lower"])
        {
            destinationFloorLevel = 3;
        }
        else if ([n2.floor isEqualToString:@"star"])
        {
            destinationFloorLevel = 4;
        }
        
        NSString *myPdfFilePath;
        if ((sourceFloorLevel - destinationFloorLevel) < 0) {
            myPdfFilePath  = [[NSBundle mainBundle] pathForResource:@"downstairs" ofType: @"pdf"];
        }
        else {
            myPdfFilePath  = [[NSBundle mainBundle] pathForResource:@"upstairs" ofType: @"pdf"];
        }
        
        NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
        [*nextPath loadRequest:[NSURLRequest requestWithURL:targetURL]];
        
        // TODO: display how many floors to go up/down
    }
    
    // instead of this, use 3 webviews and keep next and previous views pre rendered?
    [NSTimer scheduledTimerWithTimeInterval:.04 target:self selector:@selector(swapViews) userInfo:nil repeats:NO];
}

- (void)swapViews
{
    if ([_path isHidden]) {
        [_path setHidden:NO];
        [_path2 setHidden:YES];
    } else {
        [_path2 setHidden:NO];
        [_path setHidden:YES];
    }
}


@end
