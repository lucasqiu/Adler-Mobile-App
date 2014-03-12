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
- (id)initWithCapacity:(int)capacity;
- (id)initWithCapacity:(int)capacity andType:(Class)oType; //Queue will reject objects not of that type

#pragma mark - Request info
- (BOOL)isEmpty;
- (BOOL)contains:(id<comparable, NSObject>)object;
- (Class)typeOfAllowedObjects; //Returns the type of objects allowed to be stored in the queue
- (int) size;
- (id)peek;
- (id)poll;
- (id)objectMatchingObject:(id<comparable, NSObject>)object;
- (NSArray *)toArray;
- (void)print;

#pragma mark - Mutation
- (void)clear;
- (BOOL)add:(id<comparable, NSObject>)object;
- (void)addWithPriority:(NSObject *)item Priority:(float)priority;
- (void)remove:(id<comparable, NSObject>)object;

@end
