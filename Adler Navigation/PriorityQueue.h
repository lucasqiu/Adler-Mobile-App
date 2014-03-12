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
- (id)initWithObjects:(NSSet *)objects;

#pragma mark - Request Info
- (BOOL)isEmpty;
- (id)peek;
- (BOOL)contains:(id<comparable, NSObject>)object;
- (Class)typeOfAllowedObjects;
- (int)size;
- (NSArray *)toArray;
- (void)print;

#pragma mark - Modification
- (void)clear;
- (BOOL)addWithObject:(id<comparable, NSObject>)object;
- (void)addWithPriority:(NSObject *)item Priority:(float)priority;
- (id)poll;
- (void)remove:(id<comparable, NSObject>)object;

@end
