//
//  MapViewController.m
//  Adler Navigation
//
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "MapViewController.h"
#import "Node.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
 * Draws the next direction and places the text direction on the view.
 * Removes the used Nodes from path.
 */
- (void)nextDirection:(NSMutableArray *)path
{
    Node *node1 = [path firstObject];
    Node *node2 = [path objectAtIndex:1];
    [path removeObjectAtIndex:0];
    
    // change image based on zCoord
    
    CGPoint points[2];
    points[0].x = node1.xCoordinate;
    points[0].x = node1.yCoordinate;
    points[1].x = node2.xCoordinate;
    points[1].x = node2.yCoordinate;
    
    unsigned i;
    for (i = 1; i < [path count]; i++) {
        Node *cur = [path objectAtIndex:i];
        //[MapViewController drawDirectionFrom:[path objectAtIndex:i-1] to:cur];
        points[i-1].x = cur.xCoordinate;
        points[i-1].y = cur.yCoordinate;
        
        if ([cur class] == [Node class]) {
            Node *exit = (Node *) cur;
            //NSString *nextRoom = [start inRoom:exit.room1] ? exit.room2 : exit.room1;
            //text = [text stringByAppendingString:[NSString stringWithFormat:@"Go into the %@", nextRoom] ];
            // need modification 
            break;
        }
    }
    
    [self drawLineSegments:points count:i];
    
    //path = path objectsAtIndexes:[i..[path count];
}

+ (void)drawDirectionFrom:(Node *)n1 to:(Node *)n2
{
    
    NSString *text = [NSString stringWithFormat:@"Go towards %@", node2.id];
    //display text
}

- (void)drawLineSegments:(CGPoint *)points count:(size_t)count
{
    //[sender setTitle:@"test" forState:UIControlStateNormal];
    
    UIImage *image = self.imageView.image;
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
    
    [self.imageView setImage:retImage];
}

@end
