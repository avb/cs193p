//
//  Hello_WorldAppDelegate.m
//  Hello World
//
//  Created by Adam Brown on 4/13/09.
//  Copyright Adam Brown 2009. All rights reserved.
//

#import "Hello_WorldAppDelegate.h"

@implementation Hello_WorldAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
