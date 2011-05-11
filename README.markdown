## What is it?

`JMWhenTapped` is a simple little syntactical-sugar addition to all `UIView` objects, as well as any class that inherits from `UIView`. It allows you to assign touch-up, touch-down, tapped (touched down then up), double taps and two finger taps actions to a `UIView` object using a convenient blocks-style syntax. (Examples shown below).

## Installation

Clone the repo. Add the `JMWhenTapped` folder to your iOS 4 project. `#import "JMWhenTapped.h"` wherever you'd like to use the syntax.

## Examples & Usage

Use it like this:
	
	[myView whenTapped:^{
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

This works the same way with double tap and two finger taps.

## The Different Actions

The `whenTapped:` method should be used in cases where you simply want something to happen when the user taps on a view (i.e. you are concerned with performing some action when their finger is down then up, like changing to a "pressed" state.)

The `whenDoubleTapped:` method is used when you want to check for double taps on your view.

The `whenTwoFingerTapped:` method is used when you want to check for single taps made with two fingers (like in Maps.app).

The `whenTouchedDown:` method should be used when you want to trigger some action when the user touches down on your view.

The `whenTouchedUp:` method should be used when you want to trigger some action when the user touches up on your view.

## Demo

Included in this repo is a demo Xcode project that illustrates a quick example of how to use `JMWhenTapped`.