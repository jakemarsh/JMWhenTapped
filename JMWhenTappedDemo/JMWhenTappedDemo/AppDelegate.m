//
//  JMWhenTappedDemoAppDelegate.m
//  JMWhenTappedDemo
//
//  Created by Jake Marsh on 4/27/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	_viewController = [[DemoViewController alloc] init];
	_window.rootViewController = _viewController;

	[_window makeKeyAndVisible];

    return YES;
}

- (void) dealloc {
	[_window release];
	[_viewController release];

    [super dealloc];
}

@end