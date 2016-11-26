//
//  KuaiviewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/1.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "KuaiviewController.h"

@interface KuaiviewController ()
    
@property (weak, nonatomic) UIView *blueView;

@end

@implementation KuaiviewController
    
/**
    块动画
 - +(void)animateWithDuration:(NSTimeInterval)duration
 animations:(void (^)(void))animations
 completion:(void (^__nullable)(BOOL finished))completion;
 
 - +(void)animateWithDuration:(NSTimeInterval)duration
 animations:(void (^)(void))animations;
 
 - +(void)animateWithDuration:(NSTimeInterval)**duration**
 delay:(NSTimeInterval)**delay**
 usingSpringWithDamping:(CGFloat)**dampingRatio**
 initialSpringVelocity:(CGFloat)**velocity**
 options:(UIViewAnimationOptions)**options**
 animations:(void (^)(void))**animations**
 completion:(void (^__nullable)(BOOL finished))**completion**;
     - duration : 动画时间
     - delay : 延迟时间
     - dampingRatio : 阻尼系数(弹性) 越小越弹
     - velocity : 速率
     - options : 选项
     - animations : 做动画的代码块
     - completion : 动画完成的代码块 "回调"
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *bluV = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 50, 50)];
    
    bluV.backgroundColor = [UIColor blueColor];
    
    self.blueView = bluV;
    
    [self.view addSubview:_blueView];
    
}


// 触摸屏幕上的view就会调用此方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /**
     Duration: 动画时间
     delay: 延迟
     Damping: 阻尼  它传的是0~1  值越小弹力越大
     Velocity:速率
     options:选项
     animations:要执行动画的代码
     completion:动画执行完成之后村执行的代码
     */
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.1 initialSpringVelocity:0 options:UIViewAnimationOptionRepeat animations:^{
        self.blueView.backgroundColor = [UIColor redColor];
                self.blueView.frame = CGRectMake(200, 500, 50, 50);
    } completion:nil];
    
    
}
@end
