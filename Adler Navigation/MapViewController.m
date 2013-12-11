//
//  MapViewController.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/22/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "MapViewController.h"
#import "Node.h"
#import "Edge.h"
#import "ExitNode.h"
#import "TravelNode.h"
#import "ExhibitNode.h"
#import "MapGraph.h"
#import "PriorityQueue.h"

@interface MapViewController ()

@end

@implementation MapViewController

const integer_t INFINIT = -1;


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
- (NSMutableArray *) dijkstra:(MapGraph *)graph  from:(Node *)source to:(Node *)goal
{
    
    NSMutableArray *visited = [[NSMutableArray alloc] init];
    NSMutableArray *previous = [[NSMutableArray alloc] init];
    NSMutableDictionary *dist =  [[NSMutableDictionary alloc] init];
    PriorityQueue *Q = NULL;
    
    int i;
    for( i = 0; i < [graph.nodes count]; i = i + 1 ){
        [dist setValue:[NSNumber numberWithFloat:INFINIT] forKey: [source id]];
        [visited addObject: false];
        [previous addObject: NULL];
    }
    
    [dist setValue: [NSNumber numberWithFloat:0.0] forKey: [source id]];
    
    [Q addItem:source withPriority: 0.0]; //set distance to source to 0
    
    while (![Q isEmpty]) {
        
        Node *cur = (Node *)[Q getItemLeastPriority]; // also removes the item underneath
       
        if ([cur id] == [goal id]){
            return previous;
        }
        
        i = 0;
        NSSet *neighbors = [graph getAdjacentEdges:cur];
        
        for(Edge * e in neighbors){
            float alternative = [[dist valueForKey:[cur id]] floatValue] + [e distance];
            Node *v;
            if (e.node1 == cur){
                v = e.node2;
            }
            else{
                v = e.node1;
            }
            if (alternative < [[dist valueForKey:[cur id]] floatValue]) {
                [dist setValue:[NSNumber numberWithFloat:alternative] forKey:[v id]];
            }
        }
    }
    return NULL;
}






/*
 * Draws the next direction and places the text direction on the view.
 * Removes the used Nodes from path.
 */
+ (void)nextDirection:(NSArray *)path
{
    NSString *text = @"";
    Node *start = [path firstObject];
    
    unsigned i;
    for (i = 1; i < [path count]; i++) {
        Node *cur = [path objectAtIndex:i];
        [MapViewController drawDirectionFrom:[path objectAtIndex:i-1] to:cur];
        
        if ([cur class] == [ExitNode class]) {
            ExitNode *exit = (ExitNode *) cur;
            NSString *nextRoom = [start inRoom:exit.room1] ? exit.room2 : exit.room1;
            text = [text stringByAppendingString:[NSString stringWithFormat:@"Go into the %@", nextRoom] ];
            break;
        }
    }
    
    //path = path objectsAtIndexes:[i..[path count];
}










/*
 * Draw the step-by-step direction on screen
 *
 */
+ (void)drawDirectionFrom:(Node *)n1 to:(Node *)n2
{
    
}



















@end
