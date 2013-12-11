//
//  PriorityQueue.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 12/11/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

- (void)addItem:(NSObject *)item withPriority:(float)priority;

- (NSObject *)getItemLeastPriority;

- (Boolean)isEmpty;
@end
