//
//  CWBAnimation.m
//  CWBAnimationFramework
//
//  Created by ciome on 2017/5/17.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "CWBAnimation+private.h"
#import "CWBAnimationUnit+private.h"


@interface CWBAnimation ()

@property (nonatomic,assign)  BOOL  isPlay;

@end



@implementation CWBAnimation



+ (CWBAnimation *)getInstance
{
    static CWBAnimation *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[CWBAnimation alloc] init];
    });
    return factory;
}


- (instancetype)init
{
    if (self = [super init]) {
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animationPool)];
        self.animationMuAry = [NSMutableArray arrayWithCapacity:1];
        self.isPlay = false;
        
    }
    return self;
}


- (void)addAnimationUnit:(CWBAnimationUnit *)animationUnit
{
   if(!self.isPlay)
   {
       [self startDisplay];
   }
   [self.animationMuAry addObject:animationUnit];
       
}


- (void) startDisplay
{
    self.isPlay = true;
    [self.displayLink setPaused:false];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


- (void) endDisplay
{
    self.isPlay = false;
    [self.displayLink setPaused:true];
    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


- (void)stopDisplay
{
    [self endDisplay];
    [self.animationMuAry removeAllObjects];
}


- (void)animationPool
{
    if(self.animationMuAry.count == 0)
    {
        // 没有任何动画单元时，移除监听
        [self endDisplay];
        return;
    }
    [self.animationMuAry enumerateObjectsUsingBlock:^(CWBAnimationUnit * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(obj.view)
        {
            [obj display:^(BOOL isEnd) {
                if(isEnd)
                {
                    [self.animationMuAry removeObject:obj];
                }
            }];
        }
        else
        {
            // 对象已销毁，则移除动画单元持有
            [self.animationMuAry removeObjectAtIndex:idx];
        }
        
    }];

}


#pragma mark - 操作

+ (void)play
{
    [[self getInstance] startDisplay];
}


+ (void)pause
{
    [[self getInstance] endDisplay];
}


+ (void)stop
{
    [[self getInstance] startDisplay];
}


+(void)addAnimation:(CWBAnimationUnit *)animationUnit
{
    [[self getInstance] addAnimationUnit:animationUnit];
}

@end









