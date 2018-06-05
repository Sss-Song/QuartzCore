//
//  CADisplayLinkController.m
//  QuartzCore
//
//  Created by 宋成博 on 2018/6/1.
//  Copyright © 2018年 宋成博. All rights reserved.
//


/**
 *
 CADisplayLink是一个能让我们和屏幕的刷新率相同频率讲内容画到屏幕上的定时器
 */

#import "CADisplayLinkController.h"

@interface CADisplayLinkController ()

@end

@implementation CADisplayLinkController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end








