//
//  Node.h
//  Adler Navigation
//
//  Created by Ahaan Ugale on 11/15/13.
//  Copyright (c) 2013 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject <NSCopying>

@property (nonatomic) NSString *id;
@property (nonatomic) float xCoordinate;
@property (nonatomic) float yCoordinate;
@property (nonatomic) NSString * floor;
@property (nonatomic) BOOL isSourceOrDestination;
@property (nonatomic) NSString *location;

- (BOOL)inRoom:(NSString *)room;
- (NSString*)getLocation: (Node*)node;

@end
