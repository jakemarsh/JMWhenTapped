//
//  JMWhenTappedDemoViewController.m
//  JMWhenTappedDemo
//
//  Created by Jake Marsh on 4/27/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#import "DemoViewController.h"
#import "JMWhenTapped.h"

@interface DemoViewController ()

@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;

@end

@implementation DemoViewController

@synthesize view1 = _view1;
@synthesize view2 = _view2;

- (void) loadView {
	[super loadView];

	self.view1 = [[UIView alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
	self.view1.backgroundColor = [UIColor redColor];

	[self.view addSubview:self.view1];

	[self.view1 whenTapped:^{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" 
                                                    message:@"You tapped view1! Congratulations!" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
		[a show];
	}];
    
    [self.view1 whenDoubleTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Double tapped!" 
                                                    message:@"You double tapped view1! Congratulations!" 
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
		[a show];
    }];
    
    [self.view1 whenTwoFingerTapped:^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Two finger tapped!" 
                                                    message:@"You two finger tapped view1! Congratulations!" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
		[a show];
    }];


	self.view2 = [[UIView alloc] initWithFrame:CGRectMake(140.0, 20.0, 100.0, 100.0)];
	self.view2.backgroundColor = [UIColor blueColor];

	[self.view addSubview:self.view2];

    __block DemoViewController *safeSelf = self;
	[self.view2 whenTouchedDown:^{
		safeSelf.view2.backgroundColor = [UIColor yellowColor];
	}];

	[self.view2 whenTouchedUp:^{
		safeSelf.view2.backgroundColor = [UIColor blueColor];

		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Tapped!" 
                                                    message:@"You tapped view2! Congratulations!" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
		[a show];
	}];

}

#pragma mark Cleanup Methods

- (void) viewDidUnload {
    [super viewDidUnload];
}
- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end