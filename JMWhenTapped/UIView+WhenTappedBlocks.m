//
//  UIView+WhenTappedBlocks.m
//
//  Created by Jake Marsh on 3/7/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import "UIView+WhenTappedBlocks.h"
#import <objc/runtime.h>

@interface UIView (JMWhenTappedBlocks_Private)

- (void)runBlockForKey:(void *)blockKey;
- (void)setBlock:(JMWhenTappedBlock)block forKey:(void *)blockKey;

- (void)addTapGestureRecognizerWithTaps:(NSUInteger) taps touches:(NSUInteger) touches selector:(SEL) selector;

@end

@implementation UIView (JMWhenTappedBlocks)

static char kWhenTappedBlockKey;
static char kWhenDoubleTappedBlockKey;
static char kWhenTwoFingerTappedBlockKey;
static char kWhenTouchedDownBlockKey;
static char kWhenTouchedUpBlockKey;

#pragma mark -
#pragma mark Set blocks

- (void)runBlockForKey:(void *)blockKey {
    JMWhenTappedBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}

- (void)setBlock:(JMWhenTappedBlock)block forKey:(void *)blockKey {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark -
#pragma mark When Tapped

- (void)whenTapped:(JMWhenTappedBlock)block {
    [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(viewWasTapped)];
    
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)whenDoubleTapped:(JMWhenTappedBlock)block {
    [self addTapGestureRecognizerWithTaps:2 touches:1 selector:@selector(viewWasDoubleTapped)];
    
    [self setBlock:block forKey:&kWhenDoubleTappedBlockKey];
}

- (void)whenTwoFingerTapped:(JMWhenTappedBlock)block {
    [self addTapGestureRecognizerWithTaps:1 touches:2 selector:@selector(viewWasTwoFingerTapped)];
    
    [self setBlock:block forKey:&kWhenTwoFingerTappedBlockKey];
}

- (void)whenTouchedDown:(JMWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedDownBlockKey];
}

- (void)whenTouchedUp:(JMWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedUpBlockKey];
}

#pragma mark -
#pragma mark Callbacks

- (void)viewWasTapped {
    [self runBlockForKey:&kWhenTappedBlockKey];
}

- (void)viewWasDoubleTapped {
    [self runBlockForKey:&kWhenDoubleTappedBlockKey];
}

- (void)viewWasTwoFingerTapped {
    [self runBlockForKey:&kWhenTwoFingerTappedBlockKey];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedDownBlockKey];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedUpBlockKey];
}

#pragma mark -
#pragma mark Helpers

- (void)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGesture];
    [tapGesture release];
}

@end

#endif
