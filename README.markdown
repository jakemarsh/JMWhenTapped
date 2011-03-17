Use Like This:
	
	[myView whenTappped:^{
		NSLog(@"I was tapped!");		
	}];

	[myView whenTouchedDown:^{
		NSLog(@"I was touched down!");
	}];

	[myView whenTouchedUp:^{
		NSLog(@"I was touched up!");		
	}];
