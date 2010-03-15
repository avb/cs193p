//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Adam Brown on 5/3/09.
//  Copyright Adam Brown 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

