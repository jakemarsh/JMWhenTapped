//
//  UIView+WhenTappedBlocks.h
//
//  Created by Jake Marsh on 3/7/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import <UIKit/UIKit.h>

typedef void (^WhenTappedBlock)();

@interface UIView (WhenTappedBlocks) <UIGestureRecognizerDelegate>

- (void)whenTapped:(WhenTappedBlock)block;
- (void)whenTouchedDown:(WhenTappedBlock)block;
- (void)whenTouchedUp:(WhenTappedBlock)block;

@end

#endif