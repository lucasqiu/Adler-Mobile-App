//
//  Edge.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Edge : NSObject

@property (weak, nonatomic) Node *node1;
@property (weak, nonatomic) Node *node2;

- (float)distance;

@end
