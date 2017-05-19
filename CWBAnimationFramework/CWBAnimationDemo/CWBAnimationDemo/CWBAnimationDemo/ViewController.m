//
//  ViewController.m
//  CWBAnimationDemo
//
//  Created by ciome on 2017/5/17.
//  Copyright © 2017年 ciome. All rights reserved.
//

#import "ViewController.h"
#import <CWBAnimationFramework/CWBAnimationFramework.h>

@interface ViewController ()

@property (nonatomic,weak) UIView  *_animView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIImage *image = [UIImage imageNamed:@"huanhuan"];
    UIImageView *im = [[UIImageView alloc] initWithImage:image];
    [im setFrame:CGRectMake(10, 10, image.size.width*0.3 , image.size.height*0.3)];
    [self.view addSubview:im];
    self._animView = im;
    
}


- (IBAction)showMoreChange:(id)sender
{

    UIImage *image = [UIImage imageNamed:@"huanhuan"];
    NSData *imageData = UIImagePNGRepresentation(image);

    for (int i = 0; i < 100; i++) {
        
        UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];
        [im setFrame:CGRectMake(arc4random() % 100, arc4random() % 100, image.size.width*0.3 , image.size.height*0.3)];
        [self.view addSubview:im];
        __block UIImageView *block_im = im;
        CWBAnimationUnit  *animationUnit = [[CWBAnimationUnit alloc] init];
        animationUnit.view = im;
        float random_x = 40+100.00/(arc4random()%100)*(self.view.frame.size.width);
        float random_y = 50+100.00/(arc4random()%100)*(self.view.frame.size.height);
        [animationUnit moveTo:CGPointMake(random_x, random_y) duration:0.3+3/(arc4random() % 10) completion:^(BOOL finished) {
            
                    [block_im removeFromSuperview];
            
        }];
        [CWBAnimation addAnimation:animationUnit];
        
    }
    

}



- (void)moveBy:(id)sender
{
    CWBAnimationUnit  *animationUnit = [[CWBAnimationUnit alloc] init];
    animationUnit.view = self._animView;
    [animationUnit moveBy:CGPointMake(100, 100) duration:0.7 completion:^(BOOL finished) {
        
//        [self._animView removeFromSuperview];
        
    }];
    [CWBAnimation addAnimation:animationUnit];
}


- (void)moveTo:(id)sender
{
    CWBAnimationUnit  *animationUnit = [[CWBAnimationUnit alloc] init];
    animationUnit.view = self._animView;
    [animationUnit moveTo:CGPointMake(100, 100) duration:0.7 completion:^(BOOL finished) {
        
        NSLog(@"完成moveTo 动作");
        
    }];
    [CWBAnimation addAnimation:animationUnit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
