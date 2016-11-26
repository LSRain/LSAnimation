//
//  XiuViewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "XiuViewController.h"

@interface XiuViewController ()

@end

@implementation XiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置控制器view的背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:35 / 255.0 green:39 / 255.0 blue:63 / 255.0 alpha:1];
    
    // 1.创建支付宝按钮
    UIButton *zfbBtn = [[UIButton alloc] init];
    // 设置按钮图片
//    [zfbBtn setImage:[UIImage imageNamed:@"alipay_msp_op_success"] forState:UIControlStateNormal];

    [zfbBtn setImage:[UIImage imageNamed:@"img.bundle/alipay_msp_op_success"] forState:UIControlStateNormal];

    // 设置大小
    zfbBtn.bounds = CGRectMake(0, 0, 50, 50);
    // 设置位置
    zfbBtn.center = self.view.center;
    
    // 给按钮添加监听方法
    [zfbBtn addTarget:self action:@selector(zfbBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:zfbBtn];
}

// 点击支付宝按钮时调用此方法
- (void)zfbBtnClick:(UIButton *)btn {
    
    for (NSInteger i = 0; i < 10; i++) {
        // 创建一个要执行动画的圆圈
        UIView *circleView = [[UIView alloc] init];
        // 0	170	238
        circleView.backgroundColor = [UIColor colorWithRed:0 green:170 / 255.0 blue:238 / 255.0 alpha:1];
        
        circleView.frame = btn.frame;
        
        /***** 切圆角 *******/
        circleView.layer.cornerRadius = btn.bounds.size.width * 0.5;
        
        // 超出边界裁剪掉
        circleView.layer.masksToBounds = YES;
        
        //    [self.view addSubview:circleView];
        // 把圆圈view添加到zfb按钮的后面
        [self.view insertSubview:circleView belowSubview:btn];
        
        // 开启延迟动画"每一个延迟时间动态变化"
        [UIView animateWithDuration:1 delay:(0.3 * i) options:UIViewAnimationOptionCurveLinear animations:^{
            // 动画去放大
            circleView.transform = CGAffineTransformMakeScale(15, 15);
            // 让它完全透明
            circleView.alpha = 0;
        } completion:^(BOOL finished) {
            // 最后把它从父控件中移除掉
            [circleView removeFromSuperview];
        }];
    }
}
@end
