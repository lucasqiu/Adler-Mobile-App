//
//  comparable.h
//  Adler Navigation
//
//  Created by Shi Qiu on 3/12/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol comparable <NSObject>
- (int)compareTo:(id<comparable, NSObject>)object;
- (BOOL)isEqual:(id<comparable, NSObject>)object;
@end
