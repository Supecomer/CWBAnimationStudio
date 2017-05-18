//
//  CWBAnimation+private.h
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimation.h"
#import <QuartzCore/QuartzCore.h>

@class CWBAnimationUnit;
@interface CWBAnimation ()

+(CWBAnimation *)getInstance;

/**
  硬件刷帧定时器
 */
@property (nonatomic,strong) CADisplayLink  *displayLink;

/**
 动画数组
 */
@property (nonatomic,strong) NSMutableArray<CWBAnimationUnit *> *animationMuAry;


@end
