//
//  PriorityQueue.m
//  Adler Navigation
//
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import "PriorityQueue.h"

@interface Item : NSObject
@property (nonatomic, strong) NSObject *obj;
@property (nonatomic) float priority;
@end
@implementation Item
@end

@implementation PriorityQueue{
    NSMutableArray *items;
    int startIdx;
}



- (id)init{
    self = [super init];
    if (self)
    {
        items = [[NSMutableArray alloc] init];
        startIdx = 0;
    }
    return self;
}


- (BOOL)isEmpty{
    if([items objectAtIndex:0] == nil){
        return YES;
    }
    return NO;
}


- (id)peek{
    if ([self isEmpty]==YES){
        return nil;
    }
    return [items objectAtIndex:0];
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

@end
