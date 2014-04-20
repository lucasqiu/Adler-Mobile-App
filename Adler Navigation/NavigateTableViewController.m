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
    [_view2 setHidden:YES];
    
    [_nextImage setTintColor:[UIColor blueColor]];
    [_nextImage setIncrementImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_nextImage setDecrementImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];

    [super viewDidLoad];

    MapGraph * mg = [[MapGraph alloc] init];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"map_data_all" ofType:@"plist"];
    [mg createGraphFromFile:filePath];
    Node* pointA =  [mg getNodeById:_source];
    Node* pointB = [mg getNodeById:_destination];
    _path = [[NSMutableArray alloc] init];
    
    _path = [MapViewController dijkstra:mg from:pointA to:pointB];
    
    self.nextImage.maximumValue = ([_path count] - 2);
    
    Node * n1 = [_path objectAtIndex:0];
    Node * n2 = [_path objectAtIndex:1];
    
    [self drawPath:_view1 node1:n1 node2:n2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    NSUInteger value = sender.value;
    Node * n1 = [_path objectAtIndex:value];
    Node * n2 = [_path objectAtIndex:value+1];
    
    UIWebView *nextView;
    if ([_view1 isHidden]) {
        nextView = _view1;
    } else {
        nextView = _view2;
    }
    
    [self drawPath:nextView node1:n1 node2:n2];
    
    // instead of this, use 3 webviews and keep next and previous views pre rendered?
    [NSTimer scheduledTimerWithTimeInterval:.045 target:self selector:@selector(swapViews) userInfo:nil repeats:NO];
}

- (void)drawPath:(UIWebView *)view node1:(Node *)n1 node2:(Node *)n2
{
    if ([n1.floor isEqualToString:n2.floor]) {
        NSString *myPdfFilePath  = [[NSBundle mainBundle] pathForResource:n1.floor ofType: @"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:myPdfFilePath];
        CGPDFDocumentRef document = CGPDFDocumentCreateWithURL ((CFURLRef)targetURL);
        _page = CGPDFDocumentGetPage(document, 1);
        
        NSMutableArray *pathVisible = [[NSMutableArray alloc] init];
        for (Node *n in _path) {
            if ([n.floor isEqualToString:n1.floor]) {
                [pathVisible addObject:n];
            }
        }
        
        NSData *data = [MapViewController drawPathFromSource:n1 destination:n2 path:pathVisible onPDF:_page];
        
        [view loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
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
        [view loadRequest:[NSURLRequest requestWithURL:targetURL]];
        
        // TODO: display how many floors to go up/down
    }
}

- (void)swapViews
{
    if ([_view1 isHidden]) {
        [_view1 setHidden:NO];
        [_view2 setHidden:YES];
    } else {
        [_view2 setHidden:NO];
        [_view1 setHidden:YES];
    }
}


@end
