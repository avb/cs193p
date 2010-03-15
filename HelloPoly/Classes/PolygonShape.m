//
//  PolygonShape.m
//  WhatATool2
//
//  Created by Adam Brown on 4/19/09.
//  Copyright 2009 Adam Brown. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;


// initialization methods
- (void)dealloc {
    //NSLog(@"De-allocating polygon");
    [super dealloc];  
}

- (id) init {
    return [self initWithNumberOfSides:kMinimumNumberOfSides minimumNumberOfSides:kMinimumNumberOfSides maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides {
    return [self initWithNumberOfSides:sides minimumNumberOfSides:kMinimumNumberOfSides maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min {
    return [self initWithNumberOfSides:sides minimumNumberOfSides:min maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    if (self = [super init]) {
        minimumNumberOfSides = kMinimumNumberOfSides;
        maximumNumberOfSides = kMaximumNumberOfSides;
        numberOfSides = minimumNumberOfSides;
        
        self.minimumNumberOfSides = min;
        self.maximumNumberOfSides = max;
        self.numberOfSides = sides;
    }
    
    return self;
}

// setter methods using validation
- (void)setNumberOfSides:(int)sides {
    if (sides != numberOfSides && [self isValidNumberOfSides:sides]) {
        numberOfSides = sides;
    }
}

- (void)setMinimumNumberOfSides:(int)sides {
    if (sides != minimumNumberOfSides && [self isValidMinimumNumberOfSides:sides]) {
        minimumNumberOfSides = sides;
    }
}

- (void)setMaximumNumberOfSides:(int)sides {
    if (sides != maximumNumberOfSides && [self isValidMaximumNumberOfSides:sides]) {
        maximumNumberOfSides = sides;
    }
}

// validation methods
- (BOOL)isValidNumberOfSides:(int)sides {
    if (sides < minimumNumberOfSides) {
        return NO;
    }
    
    if (sides > maximumNumberOfSides) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isValidMinimumNumberOfSides:(int)sides {
    if (sides < kMinimumNumberOfSides) {
        return NO;
    }
    
    if (sides >= [self maximumNumberOfSides]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isValidMaximumNumberOfSides:(int)sides {
    if (sides > kMaximumNumberOfSides) {
        return NO;
    }
    
    if (sides <= [self minimumNumberOfSides]) {
        return NO;
    }
    
    return YES;
}


// angle methods
- (float)angleInDegrees {
    return (180 * (self.numberOfSides - 2) / self.numberOfSides);
}

- (float)angleInRadians {
    return (self.angleInDegrees * (M_PI /180));
}

// name/description methods
- (NSString *)name {
    NSDictionary *polyNames;
    polyNames = [NSDictionary dictionaryWithObjectsAndKeys:
             @"Digon",          [NSNumber numberWithInt:2],
             @"Triangle",       [NSNumber numberWithInt:3],
             @"Square / Quadrilateral",  [NSNumber numberWithInt:4],
             @"Pentagon",       [NSNumber numberWithInt:5],
             @"Hexagon",        [NSNumber numberWithInt:6],
             @"Heptagon",       [NSNumber numberWithInt:7],
             @"Octagon",        [NSNumber numberWithInt:8],
             @"Nonagon / Ennagon",       [NSNumber numberWithInt:9],
             @"Decagon",        [NSNumber numberWithInt:10],  
             @"Hendecagon / Undecagon",     [NSNumber numberWithInt:11],
             @"Dodecagon",      [NSNumber numberWithInt:12],
             nil];
    return [polyNames objectForKey:[NSNumber numberWithInt:self.numberOfSides]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %.2f degrees (%.6f radians).", self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

@end
