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
 */
+ (NSMutableArray *) dijkstra:     (MapGraph *)graph  from:(Node *)source to:(Node *)goal
{
    if( (!graph) || (!source) || (!goal) ){
        [NSException raise:@"Nil parameters exist!\n" format:@"Parameters nil"];
        return nil;
    }
    
    NSMutableDictionary *visited = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *previous = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dist =  [[NSMutableDictionary alloc] init];
    PriorityQueue *Q = [[PriorityQueue alloc]init];  // unvisited nodes with smallest dist first
    
    if(graph.nodes){
        for( NSString* key in graph.nodes){ // graph.nodes use id as key
            [dist setValue:[NSNumber numberWithFloat:INFINIT] forKey: key];
            [visited setValue:[NSNumber numberWithBool:NO] forKey:key];  //list of visited edges
            [previous setValue:nil forKey:key];
        }
    }else{
        [NSException raise:@"Invalid graph.nodes value" format:@"graph.nodes is invalid"];
    }
    
    [dist setValue: [NSNumber numberWithFloat:0.0] forKey: source.id];
    [Q addItem:source withPriority: 0.0];
    
    while (![Q isEmpty]) {
        NSLog(@"-------------------------------------- In While");
        NSLog([Q isEmpty] ? @"Yes" : @"No");
        
        Node *cur = (Node *)[Q getItemLeastPriority];
        //[visited setValue:[NSNumber numberWithBool:YES] forKey:cur.id];
        
        if(!cur){
            NSLog(@"-------------------------------------- Nil cur !");
            break;
        }
        
        NSSet *neighbors = [graph.adjacencyMatrix objectForKey:cur];
        Node *otherNode;
        
        for(Edge * e in neighbors){
    
            if (e.node1 == cur){ otherNode = e.node2;}
            else               { otherNode = e.node1;}
            if ([[visited valueForKey:[otherNode id] ] boolValue] == YES){
                continue;   // if othernode is visited, go to next
            }
            
            float alternative = [[dist valueForKey:cur.id] floatValue] + e.distance;
            NSLog(@"%f", e.distance);
            NSLog(@"%f", alternative);
            
            if (alternative < [[dist valueForKey:otherNode.id] floatValue]) {
                NSLog(@"-------------------------------------- Update Distance !");
                [dist setValue:[NSNumber numberWithFloat:alternative] forKey:otherNode.id];
                [previous setValue:cur forKey:otherNode.id];
                [Q addItem:otherNode withPriority: alternative];
            }
        }
        [visited setValue:[NSNumber numberWithBool:YES] forKey:cur.id]; // visited all neighbors of cur
        
        if(cur.id==goal.id){
            NSLog(@"-------------------------------------- Found destination !");
            NSLog(@"%@",cur.id);
            NSLog(@"%@",goal.id);
            
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
    [NSException raise:@"Path not found" format:@"Path not found"];
    return nil;
}



/*
 * Draws the next direction and places the text direction on the view.
 * Removes the used Nodes from path.
 */
- (UIImage *)nextDirection:(NSMutableArray *)path image:(UIImage *)image
{
    Node *node1 = [path firstObject];
    Node *node2 = [path objectAtIndex:1];
    [path removeObjectAtIndex:0];
    
    // change image based on zCoord
    
    CGPoint points[2];
    points[0].x = node1.xCoordinate;
    points[0].y = node1.yCoordinate;
    points[1].x = node2.xCoordinate;
    points[1].y = node2.yCoordinate;
    
    return [self drawLineSegments:points count:2 image:image];
    
    //NSString *text = [NSString stringWithFormat:@"Go towards %@", node2.id];
    //display text
}


- (UIImage *)drawLineSegments:(CGPoint *)points count:(size_t)count image:(UIImage *)image
{
    //[sender setTitle:@"test" forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(image.size);
    
	// draw original image into the context
	[image drawAtPoint:CGPointZero];
    
	// get the context for CoreGraphics
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
	// set stroking color and draw lines
	[[UIColor redColor] setStroke];
    
    CGContextSetLineWidth(ctx, 5.0f);
    
    CGContextStrokeLineSegments(ctx, points, count);
    
	// make image out of bitmap context
	UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    
	// free the context
	UIGraphicsEndImageContext();
    
    return retImage;
}

@end
