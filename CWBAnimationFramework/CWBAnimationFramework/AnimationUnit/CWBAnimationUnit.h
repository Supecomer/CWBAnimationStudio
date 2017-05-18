//
//  CWBAnimationUnit.h
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 动画小单元
 */
@interface CWBAnimationUnit : NSObject

@property (nonatomic,weak) UIView  *view;

/**
  帧率 默认 60
 */
@property (nonatomic,assign) int    frameRate;


- (void)pause;
- (void)play;
- (void)stop;


@end


@interface CWBAnimationUnit (move)

/**
 移动
 
 @param point 移动增加的量
 */
- (void) moveBy:(CGPoint)point withTime:(NSTimeInterval)time;

@end
