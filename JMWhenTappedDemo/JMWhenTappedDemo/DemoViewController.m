//
//  JMWhenTappedDemoViewController.m
//  JMWhenTappedDemo
//
//  Created by Jake Marsh on 4/27/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#import "DemoViewController.h"
#import "JMWhenTapped.h"

@implementation DemoViewController

- (void) loadView {
	[super loadView];

	_view1 = [[UIView alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
	_view1.backgroundColor = [UIColor redColor];

	[self.view addSubview:_view1];

	[_view1 whenTapped:^{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" message:@"You tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
		[a release];
	}];
    
    [_view1 whenDoubleTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Double tapped!" message:@"You double tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
		[a release];
    }];
    
    [_view1 whenTwoFingerTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Two finger tapped!" message:@"You two finger tapped view1! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
		[a release];
    }];

	[_view1 release];

	_view2 = [[UIView alloc] initWithFrame:CGRectMake(140.0, 20.0, 100.0, 100.0)];
	_view2.backgroundColor = [UIColor blueColor];

	[self.view addSubview:_view2];

	[_view2 whenTouchedDown:^{
		_view2.backgroundColor = [UIColor yellowColor];
	}];

	[_view2 whenTouchedUp:^{
		_view2.backgroundColor = [UIColor blueColor];

		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" message:@"You tapped view2! Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[a show];
		[a release];
	}];

	[_view2 release];
}

#pragma mark Cleanup Methods

- (void) viewDidUnload {
    [super viewDidUnload];
}
- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void) dealloc {
    [super dealloc];
}

@end