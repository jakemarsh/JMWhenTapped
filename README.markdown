### Installation

Clone the repo. Add the `JMWhenTapped` folder to your iOS 4 project. `#import "UIView+WhenTappedBlocks.h"` wherever you'd like to use the syntax.

### Usage

Use it like this:
	
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
