//
//  PolygonShape.h
//  WhatATool2
//
//  Created by Adam Brown on 4/19/09.
//  Copyright 2009 Adam Brown. All rights reserved.
//

#define kMinimumNumberOfSides 3
#define kMaximumNumberOfSides 12

#import <UIKit/UIKit.h>

@interface PolygonShape : NSObject {
    // instance variables
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

// property declarations
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;

@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;

@property (readonly) NSString *name;
@property (readonly) NSString *description;

// methods
- (id)initWithNumberOfSides:(int)sides;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

- (BOOL)isValidNumberOfSides:(int)sides;
- (BOOL)isValidMinimumNumberOfSides:(int)sides;
- (BOOL)isValidMaximumNumberOfSides:(int)sides;

- (NSString *)name;
- (NSString *)description;

@end
