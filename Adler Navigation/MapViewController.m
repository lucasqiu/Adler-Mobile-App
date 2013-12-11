//
//  MapViewController.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/22/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "MapViewController.h"
#import "Node.h"
#import "ExitNode.h"
#import "TravelNode.h"
#import "ExhibitNode.h"

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

+ (void)drawDirectionFrom:(Node *)n1 to:(Node *)n2
{
    
}

@end
