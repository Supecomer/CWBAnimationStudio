//
//  CWBAnimation.h
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/17.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import <Foundation/Foundation.h>



@class CWBAnimationUnit;
@interface CWBAnimation : NSObject


/**
 暂停所有动画
 */
+ (void)pause;

/**
 播放所有动画
 */
+ (void)play;


/**
 停止所有动画
 */
+ (void)stop;


/**
 添加动画

 @param animationUnit 动画单元
 */
+ (void)addAnimation:(CWBAnimationUnit *)animationUnit;



@end
