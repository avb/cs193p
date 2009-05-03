//
//  PolygonShape.m
//  WhatATool2
//
//  Created by Adam Brown on 4/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (id) init {
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    if (self = [super init]) {
        minimumNumberOfSides = 3;
        maximumNumberOfSides = 12;
        self.minimumNumberOfSides = min;
        self.maximumNumberOfSides = max;
        self.numberOfSides = sides;
    }
    return self;
}

- (void)setNumberOfSides:(int)value {
    if (value >= self.minimumNumberOfSides && value <= self.maximumNumberOfSides){
        numberOfSides = value;
    } else if (value < self.minimumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed.", value, self.minimumNumberOfSides);
    } else if (value > self.maximumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed.", value, self.maximumNumberOfSides);
    }
}

- (void)setMinimumNumberOfSides:(int)value {
    if (value > 2) {
        minimumNumberOfSides = value;
    } else {
        NSLog(@"Invalid number of sides: A minimum of 3 sides is required");
    }
}

- (void)setMaximumNumberOfSides:(int)value {
    if (value <= 12) {
        maximumNumberOfSides = value;
    } else {
        NSLog(@"Invalid number of sides: Maximum number of sides cannot exceed 12.");
    }
}

- (float)angleInDegrees {
    return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians {
    return (self.angleInDegrees * (M_PI /180));
}

- (NSString *)name {
    NSDictionary *polyNames;
    polyNames = [NSDictionary dictionaryWithObjectsAndKeys:
             @"Digon",          [NSNumber numberWithInt:2],
             @"Triangle",       [NSNumber numberWithInt:3],
             @"Quadrilateral",  [NSNumber numberWithInt:4],
             @"Pentagon",       [NSNumber numberWithInt:5],
             @"Hexagon",        [NSNumber numberWithInt:6],
             @"Heptagon",       [NSNumber numberWithInt:7],
             @"Octagon",        [NSNumber numberWithInt:8],
             @"Enneagon",       [NSNumber numberWithInt:9],
             @"Decagon",        [NSNumber numberWithInt:10],  
             @"Hendecagon",     [NSNumber numberWithInt:11],
             @"Dodecagon",      [NSNumber numberWithInt:12],
             nil];
    return [polyNames objectForKey:[NSNumber numberWithInt:self.numberOfSides]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %.2f degrees (%.6f radians).", self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

@end
