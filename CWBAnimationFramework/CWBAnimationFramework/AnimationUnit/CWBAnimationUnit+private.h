//
//  CWBAnimationUnit+private.h
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimationUnit.h"

typedef void(^CWBAnimationResult)(BOOL isEnd);
typedef void(^CWBAnimationCompletion)(BOOL finished);





@interface CWBAnimationUnit ()

@property (nonatomic,assign) BOOL  isPlay;

#pragma mark - moveBy
@property (nonatomic,assign) CGPoint  moveByPoint;
@property (nonatomic,assign) float    moveBy_xChange;
@property (nonatomic,assign) float    moveBy_yChange;
@property (nonatomic,copy) CWBAnimationCompletion  moveBy_complete;
@property (nonatomic,assign) NSInteger moveBy_frameTimes;


#pragma mark - moveTo
@property (nonatomic,assign) CGPoint  moveToPoint;
@property (nonatomic,assign) float    moveTo_xChange;
@property (nonatomic,assign) float    moveTo_yChange;
@property (nonatomic,copy) CWBAnimationCompletion  moveTo_complete;
@property (nonatomic,assign) NSInteger moveTo_frameTimes;




- (void)display:(CWBAnimationResult)result;

@end
