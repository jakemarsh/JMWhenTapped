//
//  JMWhenTappedBlockKeeper.h
//
//  Created by Jake Marsh on 3/7/11.
//  Copyright 2011 Rubber Duck Software. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import <Foundation/Foundation.h>

typedef void (^JMActionBlock)();

@interface JMWhenTappedBlockKeeper : NSObject <UIGestureRecognizerDelegate> {
    NSMutableDictionary *_whenTappedBlocks;
    NSMutableDictionary *_whenTouchedDownBlocks;
    NSMutableDictionary *_whenTouchedUpBlocks;
}

+ (JMWhenTappedBlockKeeper *) sharedInstance;

- (void) setBlock:(JMActionBlock)b forWhenViewIsTapped:(UIView *)v;
- (void) setBlock:(JMActionBlock)b forWhenViewIsTouchedDown:(UIView *)v;
- (void) setBlock:(JMActionBlock)b forWhenViewIsTouchedUp:(UIView *)v;

- (JMActionBlock) tapActionBlockForView:(UIView *)v;
- (JMActionBlock) downActionBlockForView:(UIView *)v;
- (JMActionBlock) upActionBlockForView:(UIView *)v;

@end

#endif