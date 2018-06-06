//
//  ViewController.m
//  QuartzCore
//
//  Created by 宋成博 on 2018/6/1.
//  Copyright © 2018年 宋成博. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "CADisplayLinkController.h"


/**
 *
 QuartzCore
 QuartzCore框架里面包含了CoreAnimation框架
 CoreAnimation是苹果的核心动画框架
 */


/**
 *
 CoreAnimation里面包含了如下的类:
 CAAnimation 核心动画
 CADisplayLink
 CAEAGLLayer
 CAEmitterCell
 CAEmitterLayer
 CAGradientLayer
 CALayer
 CAMediaTiming
 CAMediaTimingFunction
 CAReplicatorLayer
 CAScrollLayer
 CAShapeLayer
 CATextLayer
 CATiledLayer
 CATransaction
 CATransform3D
 CATransformLayer
 CAValueFunction
 */



static NSString *const cellID = @"cellID";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *Tab;
@property (nonatomic,strong) NSArray *data;
@end

@implementation ViewController

-(NSArray *)data
{
    if (!_data) {
        _data = @[@"CAAnimation",@"CADisplayLink",@"CAEAGLLayer",@"CALayer",@"CAEmitterCell",@"CAEmitterLayer",@"CAGradientLayer",@"CAMediaTiming"];
    }
    return _data;
}

-(UITableView *)Tab
{
    if (!_Tab) {
        _Tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _Tab.delegate = self;
        _Tab.dataSource = self;
    }
    return _Tab;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.Tab];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==1) {
        CADisplayLinkController *vc = [[CADisplayLinkController alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
    }
  
}

@end









