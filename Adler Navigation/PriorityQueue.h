//
//  PriorityQueue.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 12/11/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "comparable.h"

@interface PriorityQueue : NSObject

#pragma mark - Init
- (id)init;

- (void)addItem:(NSObject *)obj withPriority:(float)priority;

- (NSObject *)getItemLeastPriority;

- (Boolean)isEmpty;

@end
