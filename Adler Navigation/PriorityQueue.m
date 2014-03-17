//
//  PriorityQueue.m
//  Adler Navigation
//
//  Created by Ahaan Ugale on 12/11/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "PriorityQueue.h"

@interface Item : NSObject
@property (nonatomic, strong) NSObject *obj;
@property (nonatomic) float priority;
@end
@implementation Item
@end

@implementation PriorityQueue
{
    NSMutableArray *items;
    int startIdx;
}


- (id)init
{
    self = [super init];
    if (self)
    {
        items = [[NSMutableArray alloc] init];
        startIdx = 0;
    }
    return self;
}

- (void)addItem:(NSObject *)obj withPriority:(float)priority
{
    int i = startIdx;
    while (i < [items count] && ((Item *)[items objectAtIndex:i]).priority < priority ) {
        i++;
    }
    
    Item *item = [[Item alloc] init];
    item.obj = obj;
    item.priority = priority;
    
    [items insertObject:item atIndex:i];
}

- (NSObject *)getItemLeastPriority
{
    return ((Item *)[items objectAtIndex:startIdx++]).obj;
}

- (Boolean)isEmpty
{
    return (startIdx == [items count]);
}

@end
