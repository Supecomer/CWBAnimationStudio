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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    

    UIImage *image = [UIImage imageNamed:@"huanhuan"];
    UIImageView *im = [[UIImageView alloc] initWithImage:image];
    [im setFrame:CGRectMake(10, 10, image.size.width*0.3 , image.size.height*0.3)];
    [self.view addSubview:im];
    
    
    CWBAnimationUnit  *animationUnit = [[CWBAnimationUnit alloc] init];
    animationUnit.view = im;
    [animationUnit moveBy:CGPointMake(100, 100) withTime:10];
    [CWBAnimation addAnimation:animationUnit];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
