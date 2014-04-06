//
//  MapViewController.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/22/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Node.h"
#import "MapGraph.h"

@interface MapViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// TODO: Move these to NavigateTableViewController

+ (NSMutableArray*) dijkstra: (MapGraph *)graph  from:(Node *)source to:(Node *)goal;

+ (NSMutableData *)drawPathFromSource: (Node*) source Destination: (Node*) destination onPDF:(CGPDFPageRef)page;

+ (NSMutableData *)drawLineSegments:(CGPoint *)points count:(size_t)count onPDF:(CGPDFPageRef)page;

@end
