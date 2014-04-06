//
//  MapViewController.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 12/11/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//
#import "MapViewController.h"
#import "Node.h"
#import "Edge.h"
#import "MapGraph.h"
#import "PriorityQueue.h"

@interface MapViewController ()

@end

@implementation MapViewController

const integer_t INFINIT = FLT_MAX;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Set the image view as the object to zoom when pinching.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


/*
 * Find the shortest path between the source and the goal node.
 * Return a list of nodes in the order from source to goal.
 */
+ (NSMutableArray *) dijkstra:     (MapGraph *)graph  from:(Node *)source to:(Node *)goal
{
    if( (!graph) || (!source) || (!goal) ){
        [NSException raise:@"Nil parameters exist!\n" format:@"Parameters nil."];
        return nil;
    }
    
    NSMutableDictionary *visited = [[NSMutableDictionary alloc] init]; //list of visited edges
    NSMutableDictionary *previous = [[NSMutableDictionary alloc] init];// history of shortest path
    NSMutableDictionary *dist =  [[NSMutableDictionary alloc] init];   //distance of each node to source
    PriorityQueue *Q = [[PriorityQueue alloc]init];        // unvisited nodes with smallest dist first
    
    if(graph.nodes){
        for( NSString* key in graph.nodes){ // graph.nodes use id as key
            [dist setValue:[NSNumber numberWithFloat:INFINIT] forKey: key];
            [visited setValue:[NSNumber numberWithBool:NO] forKey:key];
            [previous setValue:nil forKey:key];
        }
    }else{
        [NSException raise:@"Invalid graph.nodes value." format:@"graph.nodes is invalid."];
    }
    [dist setValue: [NSNumber numberWithFloat:0.0] forKey: source.id];
    [Q addItem:source withPriority: 0.0];
    
    while (![Q isEmpty]) {
  
        Node *cur = (Node *)[Q getItemLeastPriority];
        NSSet *neighbors = [graph.adjacencyMatrix objectForKey:cur];
        Node *otherNode;
        
        for(Edge * e in neighbors){
    
            if (e.node1 == cur){ otherNode = e.node2;}
            else               { otherNode = e.node1;}
            if ([[visited valueForKey:[otherNode id] ] boolValue] == YES){
                continue;
            }
            float alternative = [[dist valueForKey:cur.id] floatValue] + e.distance;
            
            if (alternative < [[dist valueForKey:otherNode.id] floatValue]) {
                [dist setValue:[NSNumber numberWithFloat:alternative] forKey:otherNode.id];
                [previous setValue:cur forKey:otherNode.id];
                [Q addItem:otherNode withPriority: alternative];
            }
        }
        
        [visited setValue:[NSNumber numberWithBool:YES] forKey:cur.id]; // visited all neighbors of cur
        
        if(cur.id==goal.id){
            NSMutableArray* path = [[NSMutableArray alloc] init];
            [path insertObject:goal atIndex:0];
            NSString* temp = goal.id;
            while ([previous objectForKey:temp]){
                [path insertObject:[previous objectForKey:temp] atIndex:0];
                temp = [[previous objectForKey:temp] id];
            }
            return path;
        }
    }
    [NSException raise:@"Path not found." format:@"Nil path."];
    return nil;
}


/*
 * Draws the path from node1 to node2 on the image being supplied.
 * Returns pdf in data array.
 */
+ (NSMutableData *)drawPathFromSource: (Node*) source Destination: (Node*) destination onPDF:(CGPDFPageRef)page
{
    Node *node1 = source;
    Node *node2 = destination;
    
    CGPoint points[2];
    points[0].x = node1.xCoordinate;
    points[0].y = node1.yCoordinate;
    points[1].x = node2.xCoordinate;
    points[1].y = node2.yCoordinate;
    
    return [self drawLineSegments:points count:2  onPDF:page];
    
    //NSString *text = [NSString stringWithFormat:@"Go towards %@", node2.id];
    //display text
}

+ (NSMutableData *)drawLineSegments:(CGPoint *)points count:(size_t)count onPDF:(CGPDFPageRef)page
{
    CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
    
    NSMutableData *data = [[NSMutableData alloc] init];
    UIGraphicsBeginPDFContextToData(data, CGRectZero, nil);
    UIGraphicsBeginPDFPageWithInfo(pageRect, nil);
    
	// get the context for CoreGraphics
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // flip coordinates
    CGContextTranslateCTM(ctx, 0.0, pageRect.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
	// draw original image into the context
	CGContextDrawPDFPage(ctx, page);
    
    // reset coordinates
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0.0, pageRect.size.height * -1);
    
	// set stroking color and draw lines
	[[UIColor redColor] setStroke];
    
    CGContextSetLineWidth(ctx, 5.0f);
    
    CGContextStrokeLineSegments(ctx, points, count);
    
	// save the image and free the context
	UIGraphicsEndPDFContext();
    
    return data;
}

@end
