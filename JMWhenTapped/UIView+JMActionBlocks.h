//
//  UIView+JMActionBlocks.h
//
//  Created by Jake Marsh on 3/7/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import <Foundation/Foundation.h>
#import "JMWhenTappedBlockKeeper.h"

@interface UIView (JMActionBlocks)

- (void) whenTapped:(JMActionBlock)block;
- (void) whenTouchedDown:(JMActionBlock)block;
- (void) whenTouchedUp:(JMActionBlock)block;

@end

#endif