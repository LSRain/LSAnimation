//
//  CartoonViewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/1.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "CartoonViewController.h"

@interface CartoonViewController ()
    
@property (weak, nonatomic) UIView *blueView;

@end


@implementation CartoonViewController
    
/**
    头尾式动画
 
 - [UIView beginAnimations:nil context:nil];
	- 准备开始动画
 - [UIView setAnimationDuration:5];
	- 	设置时间
 - [UIView commitAnimations];
	- 	提交动画(真正开始做动画)
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *bluV = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 50, 50)];
    
    bluV.backgroundColor = [UIColor blueColor];
    
    self.blueView = bluV;
    
    [self.view addSubview:_blueView];
}
    
    
    
// 触摸屏幕上的view就会调用此方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.开启动画"上下文"
    [UIView beginAnimations:nil context:nil];
    
    // 设置动画时间
    [UIView setAnimationDuration:3];
    
    // 2.执行动画的代码
    self.blueView.backgroundColor = [UIColor redColor];
    self.blueView.frame = CGRectMake(350, 600, 50, 50);
    
    // 3.提交动画/结束动画
    [UIView commitAnimations];
}

@end
