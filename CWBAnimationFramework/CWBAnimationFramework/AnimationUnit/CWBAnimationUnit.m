//
//  CWBAnimationUnit.m
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimationUnit+private.h"
#import "CWBAnimation+private.h"


#define DEFAULT_FRAMERATE    60     // 默认帧率



@implementation CWBAnimationUnit


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frameRate = DEFAULT_FRAMERATE;
        self.isPlay = false;
    }
    
    return self;
}


- (void)play
{
    self.isPlay = true;
}


- (void)pause
{
    self.isPlay = false;
}


- (void)stop
{
    self.isPlay = false;
    self.moveBy_frameTimes = 0;
    self.moveTo_frameTimes = 0;
}


/**
 检查元素是否在桌面

 @param x x位置
 @param y y位置
 @return 检查结果，false 不在
 */
- (BOOL)checkPointWithX:(float)x withY:(float)y
{
    BOOL  isTrue = true;
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGSize view_size = self.view.frame.size;
    if ((x<-view_size.width) || (x > (size.width + view_size.width))) {
        isTrue = false;
    }
    if (y<-view_size.height || (y > (size.height + view_size.height)) ) {
        isTrue = false;
    }
    return isTrue;
}


- (void)display:(CWBAnimationResult)result
{
    if(!self.isPlay)
    {
        return;
    }
    BOOL  isHaveAnimation = false;
    if(self.moveBy_frameTimes > 0)
    {
        CGRect rect = self.view.frame;
        float x = self.view.frame.origin.x + self.moveBy_xChange;
        float y = self.view.frame.origin.y + self.moveBy_yChange;
        rect.origin.x = x;
        rect.origin.y = y;
        if ([self checkPointWithX:x withY:y]) {
            [self.view setFrame:rect];
        }
        self.moveBy_frameTimes--;
        isHaveAnimation = true;
        if (self.moveBy_frameTimes == 0) {
            if (self.moveBy_complete) {
                self.moveBy_complete(true);
            }
        }
    }
    
    if(self.moveTo_frameTimes > 0)
    {
        CGRect rect = self.view.frame;
        float x = self.view.frame.origin.x + self.moveTo_xChange;
        float y = self.view.frame.origin.y + self.moveTo_yChange;
        rect.origin.x = x;
        rect.origin.y = y;
        if ([self checkPointWithX:x withY:y]) {
            [self.view setFrame:rect];
        }
        self.moveTo_frameTimes--;
        isHaveAnimation = true;
        if (self.moveTo_frameTimes == 0) {
            if (self.moveTo_complete) {
                self.moveTo_complete(true);
            }
        }
    }

    if(!isHaveAnimation)
    {
        // 没有任何需要执行的动画时，释放此对象
        if (result) {
            result(true);
        }
    }
}

@end




@implementation CWBAnimationUnit (move)


- (void)moveBy:(CGPoint)point duration:(NSTimeInterval)duration completion:(void (^ _Nullable)(BOOL))completion
{
    self.moveByPoint = point;
    self.moveBy_frameTimes = duration*self.frameRate;
    self.moveBy_xChange = point.x/self.moveBy_frameTimes;
    self.moveBy_yChange = point.y/self.moveBy_frameTimes;
    self.isPlay = true;
    self.moveBy_complete = completion;

}

- (void)moveTo:(CGPoint)point duration:(NSTimeInterval)duration completion:(void (^)(BOOL))completion
{
    self.moveToPoint = point;
    self.moveTo_frameTimes = duration*self.frameRate;
    self.moveTo_xChange = (point.x - self.view.frame.origin.x)/self.moveTo_frameTimes;
    self.moveTo_yChange = (point.y - self.view.frame.origin.y)/self.moveTo_frameTimes;
    self.isPlay = true;
    self.moveTo_complete = completion;
}

@end







