Just `#import "UIView+WhenTappedBlocks.h"` where you want to use the syntax and then use it like this:
	
	[myView whenTappped:^{
		NSLog(@"I was tapped!");		
	}];
	
Or like this:

	[myView whenTouchedDown:^{
		NSLog(@"I was touched down!");
	}];
	
And also like this:

	[myView whenTouchedUp:^{
		NSLog(@"I was touched up!");		
	}];
