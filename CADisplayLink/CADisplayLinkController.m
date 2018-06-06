//
//  CADisplayLinkController.m
//  QuartzCore
//
//  Created by 宋成博 on 2018/6/1.
//  Copyright © 2018年 宋成博. All rights reserved.
//


/**
 *
 CADisplayLink是一个能让我们和屏幕的刷新率相同频率进行操作的定时器
 
 原理:CADisplayLink以特定的模式注册到runloop之后,每当屏幕需要刷新的时候,runloop就会调用CADisplayLink绑定的target上的selector事件,这时target可以读到CADisplayLink的每次调用的时间戳,用来准备下一帧显示需要的数据.
 属性:
 (1)duration:只读属性,每帧之间的时间,也就是屏幕每次刷新的时间间隔(IOS设备是每秒钟屏幕刷新60次);
 (2)frameInterval: 可以读写的属性,设置多少帧调用一次selector事件,默认为1,也就是1帧调用一次selector事件.iOS设置IOS设备是每秒钟屏幕刷新60次,也就是每秒60帧,那么默认就是每秒调用60次. 例如设置 frameInterval=2 那么就是每两帧调用一次,也就是变成了每秒调用30次.
 (3)pause :控制CADisplayLink开始和暂停的开关
 (4)timestamp:只读属性 获取上一次selector被执行的时间
 
 CADisplayLink 不能被继承
 */

#import "CADisplayLinkController.h"

@interface CADisplayLinkController ()
{
    CGFloat _moveY;
}
@property (nonatomic,strong) CADisplayLink *timer;
@property (nonatomic,strong) UIView *moveV;
@end

@implementation CADisplayLinkController

-(UIView *)moveV
{
    if (!_moveV) {
        _moveV = [[UIView alloc]init];
        _moveV.frame = CGRectMake(100, 100, 50, _moveY);
        _moveV.backgroundColor = [UIColor redColor];
    }
    return _moveV;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    _moveY = 30;
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.moveV];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitle:@"暂停" forState:UIControlStateSelected];
    button.selected = NO;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(300, 100, 100, 20);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(moveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(move)];
    self.timer.paused = YES;
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)moveClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.timer.paused = !self.timer.paused;
}

-(void)move
{
    _moveY+=5;
    if (_moveY>=200) {
        _moveY=30;
    }
    self.moveV.frame = CGRectMake(100, 100, 50, _moveY);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end








