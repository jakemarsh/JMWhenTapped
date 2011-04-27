## What is this?

`JMWhenTapped` is a simple little syntactical-sugar added to all `UIView` objects. It allows you to assign touch-up, touch-down, and tapped (touched down then up) actions to a `UIView` object using a convenient blocks-style syntax. (Examples shown below).

## Installation

Clone the repo. Add the `JMWhenTapped` folder to your iOS 4 project. `#import "JMWhenTapped.h"` wherever you'd like to use the syntax.

## Usage

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
