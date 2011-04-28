//
//  UIView+JMActionBlocks.m
//
//  Created by Jake Marsh on 3/7/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import "UIView+JMActionBlocks.h"

@implementation UIView (JMActionBlocks)

- (void) whenTapped:(JMActionBlock)block {
	UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasTapped:)];
	gr.delegate = [JMWhenTappedBlockKeeper sharedInstance];
	gr.numberOfTapsRequired = 1;

	self.userInteractionEnabled = YES;

	[self addGestureRecognizer:gr];

	[gr release];

	[[JMWhenTappedBlockKeeper sharedInstance] setBlock:block forWhenViewIsTapped:self];
}
- (void) whenTouchedDown:(JMActionBlock)block {
	self.userInteractionEnabled = YES;

	[[JMWhenTappedBlockKeeper sharedInstance] setBlock:block forWhenViewIsTouchedDown:self];
}
- (void) whenTouchedUp:(JMActionBlock)block {
	self.userInteractionEnabled = YES;

	[[JMWhenTappedBlockKeeper sharedInstance] setBlock:block forWhenViewIsTouchedUp:self];	
}

- (void) viewWasTapped:(id)sender {
	JMActionBlock b = [[JMWhenTappedBlockKeeper sharedInstance] tapActionBlockForView:self];

	b();
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];

	if([[JMWhenTappedBlockKeeper sharedInstance] downActionBlockForView:self]) {
		JMActionBlock b = [[JMWhenTappedBlockKeeper sharedInstance] downActionBlockForView:self];
		b();
	}
}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];	

	
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];

	if([[JMWhenTappedBlockKeeper sharedInstance] upActionBlockForView:self]) {
		JMActionBlock b = [[JMWhenTappedBlockKeeper sharedInstance] upActionBlockForView:self];
		b();
	}
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];

	
}

@end

#endif