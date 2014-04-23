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
    _view1.scrollView.bounces = NO;
    _view2.scrollView.bounces = NO;
    
    //[_nextImage setTintColor:[UIColor blueColor]];
    //[_nextImage setIncrementImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    //[_nextImage setDecrementImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];

    [super viewDidLoad];
    
    _mg = [[MapGraph alloc] init];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"map_data_all" ofType:@"plist"];
    [_mg createGraphFromFile:filePath];
    Node* pointA =  [_mg getNodeById:_source];
    Node* pointB = [_mg getNodeById:_destination];
    _path = [[NSMutableArray alloc] init];
    
    _path = [MapViewController dijkstra:_mg from:pointA to:pointB];
    
    self.nextImage.maximumValue = ([_path count] - 2);
    
    _n1 = [_path objectAtIndex:0];
    _n2 = [_path objectAtIndex:1];
    
    [self drawPath:_view1 node1:_n1 node2:_n2];
    
    [NSTimer scheduledTimerWithTimeInterval:.045 target:self selector:@selector(zoomOnArrow:) userInfo:_view1 repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    NSUInteger value = sender.value;
    _n1 = [_path objectAtIndex:value];
    _n2 = [_path objectAtIndex:value+1];
    
    UIWebView *nextView;
    if ([_view1 isHidden]) {
        nextView = _view1;
    } else {
        nextView = _view2;
    }
    
    [self drawPath:nextView node1:_n1 node2:_n2];
    
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
        
        NSData *data = [MapViewController drawPathFromSource:n1 destination:n2 path:pathVisible graph:_mg onPDF:_page];
        
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
    UIWebView *curView;
    UIWebView *nextView;
    if ([_view1 isHidden]) {
        curView = _view2;
        nextView = _view1;
    } else {
        curView = _view1;
        nextView = _view2;
    }
    if ([_n1.floor isEqualToString:_n2.floor]) {
        [self copyZoomFrom:[curView scrollView] to:[nextView scrollView]];
    }
    [[nextView scrollView] setBounces:NO];
    [nextView setHidden:NO];
    [curView setHidden:YES];
    
//    [nextView.scrollView setZoomScale:nextView.scrollView.bounds.size.width/140.0 animated:YES];
    if ([_n1.floor isEqualToString:_n2.floor]) {
        [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(zoomOnArrow:) userInfo:nextView repeats:NO];
    }
}

- (void)copyZoomFrom:(UIScrollView *)cur to:(UIScrollView *)next
{
    CGRect visibleRect;// = [next convertRect:next.bounds toView:cur];
    visibleRect.origin = cur.contentOffset;
    visibleRect.size = cur.bounds.size;
    double scale = 1.0 / [cur zoomScale];
    visibleRect.origin.x *= scale;
    visibleRect.origin.y *= scale;
    visibleRect.size.width *= scale;
    visibleRect.size.height *= scale;
    
    NSLog( @"Visible rect: %@", NSStringFromCGRect(visibleRect) );
    
    [next zoomToRect:visibleRect animated:NO];
}

- (void)zoomOnArrow:(NSTimer *)timer
{
    UIScrollView *view = [[timer userInfo] scrollView];
    CGRect pageRect = CGPDFPageGetBoxRect(_page, kCGPDFArtBox);
    float scaleFactorX = view.bounds.size.width / pageRect.size.width;
    float scaleFactorY = view.bounds.size.height / pageRect.size.height;
    
    float centerX = (_n1.xCoordinate + _n2.xCoordinate) / 2.0 *scaleFactorX;
    float centerY = (_n1.yCoordinate + _n2.yCoordinate) / 2.0 * scaleFactorY;
 //   float len = sqrtf( pow((n1.xCoordinate-n2.xCoordinate)*scaleFactorX,2) +
     //                 pow((n1.yCoordinate-n2.yCoordinate)*scaleFactorY,2) );
    
    CGRect rect;
    rect.origin = CGPointMake(centerX-70, centerY-70);
    rect.size = CGSizeMake(140, 140);
    
    NSLog( @"Rect: %@", NSStringFromCGRect(rect) );
    
    [view zoomToRect:rect animated:YES];
}

@end
