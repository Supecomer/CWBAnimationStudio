//
//  CWBAnimationUnit.m
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/18.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimationUnit+private.h"
#import "CWBAnimation+private.h"

@implementation CWBAnimationUnit


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frameRate = 60;
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
       [self.view setFrame:rect];
       self.moveBy_frameTimes--;
       isHaveAnimation = true;
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


- (void)moveBy:(CGPoint)point withTime:(NSTimeInterval)time
{
    self.moveByPoint = point;
    self.moveBy_frameTimes = time*self.frameRate;
    self.moveBy_xChange = point.x/self.moveBy_frameTimes;
    self.moveBy_yChange = point.y/self.moveBy_frameTimes;
    self.isPlay = true;

}

@end







