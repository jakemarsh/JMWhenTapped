//
//  JMWhenTappedDemoAppDelegate.h
//  JMWhenTappedDemo
//
//  Created by Jake Marsh on 4/27/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *_window;
	DemoViewController *_viewController;
}

@end