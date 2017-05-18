//
//  CWBAnimationUnit+private.h
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimationUnit.h"

typedef void(^CWBAnimationResult)(BOOL isEnd);

@interface CWBAnimationUnit ()

@property (nonatomic,assign) BOOL  isPlay;

#pragma mark - moveBy
@property (nonatomic,assign) CGPoint  moveByPoint;
@property (nonatomic,assign) float    moveBy_xChange;
@property (nonatomic,assign) float    moveBy_yChange;
/**
 读取帧次数
 */
@property (nonatomic,assign) NSInteger moveBy_frameTimes;


- (void)display:(CWBAnimationResult)result;

@end
