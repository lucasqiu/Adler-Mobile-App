//
//  MapViewController.m
//  Adler Navigation
//
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
+ (NSMutableArray *) dijkstra:     (MapGraph *)graph  from:(Node *)source to:(Node *)goal
{
    if( (!graph) || (!source) || (!goal) ){
        NSException *e;
        [e raise];
        return nil;
    }
    
    NSMutableDictionary *visited = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *previous = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dist =  [[NSMutableDictionary alloc] init];
    PriorityQueue *Q = [[PriorityQueue alloc]init];
    
    int i;
    if(graph.nodes){
        for( Node* n in graph.nodes){
            if(!n){NSLog(@"nil !!!!!!!!!!!!!!!!\n"); break;}
            
            
            
            NSLog(@"%@", [anObject class]);
            
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            
            
            if(![n xCoord]){NSLog(@"nil !!!!!!!!!!!!!!!!\n"); break;}
            else{NSLog(@"THE LOG SCORE : %f", n.xCoord);}
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            
            //NSMutableString* mStr = [NSMutableString stringWithString:nil];
            //NSLog(mStr);
            
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            NSLog(@"Ahaaaaa");
            
            
            //NSLog(@"%@", mStr );
            //[dist setValue:[NSNumber numberWithFloat:INFINIT] forKey: n.id];
            //[visited setValue:NO forKey:[n id]];
            //[previous setValue:nil forKey:[n id]];
        }
    }
 
    
//    [dist setValue: [NSNumber numberWithFloat:0.0] forKey: [source id]];
//    
//    [Q addItem:source withPriority: 0.0];

//    
//    while (![Q isEmpty]) {
//        
//        Node *cur = (Node *)[Q getItemLeastPriority];
//        if ([cur id] == [goal id]){
//            NSMutableArray *path = nil;
//            Node *temp = cur;
//            while(temp){
//                [path addObject:temp];
//                temp = [previous objectForKey: [cur id]];
//            }
//            return path;
//        }
//        
//        i = 0;
//        NSSet *neighbors = [graph getAdjacentEdges:cur];
//        for(Edge * e in neighbors){
//            
//            Node *otherNode;
//            if (e.node1 == cur){ otherNode = e.node2;}
//            else               { otherNode = e.node1;}
//            
//            float alternative = [[dist valueForKey:[cur id]] floatValue] + [e distance];
//            
//            if (alternative < [[dist valueForKey:[cur id]] floatValue]) {
//                [dist setValue:[NSNumber numberWithFloat:alternative] forKey:[otherNode id]];
//                [previous setValue:otherNode forKey:[cur id]];
//                [Q addItem:[cur id] withPriority: alternative];
//            }
//        }
//    }
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










/*
 * Draw the step-by-step direction on screen
 *
 */
+ (void)drawDirectionFrom:(Node *)n1 to:(Node *)n2
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
