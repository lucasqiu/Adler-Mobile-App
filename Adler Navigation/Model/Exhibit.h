//
//  Exhibit.h
//  Adler Navigation
//
//  Created by Shi Qiu on 4/5/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exhibit : NSObject

@property NSString* exhibitID;
@property NSString* description;
@property NSArray* images;

- (NSArray*)getImageByIndex:(int)n;
- (NSString*)getDescription;

@end