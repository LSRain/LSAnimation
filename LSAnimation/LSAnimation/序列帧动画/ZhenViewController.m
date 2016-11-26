//
//  ZhenViewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "ZhenViewController.h"

@interface ZhenViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZhenViewController


- (IBAction)startAnimation {
    
    // 1.创建可变数组用来保存所有图片
    NSMutableArray *arrM = [NSMutableArray array];
    // 2.加载图片
    for (NSInteger i = 0; i < 25; i++) {
        // 1.拼接图片名称
        NSString *imageName = [NSString stringWithFormat:@"zhen_img.bundle/father%03zd", i + 1];

        // 2.根据拼接出来的图片名称去加载图片
        UIImage *image = [UIImage imageNamed:imageName];
        
        // 3.添加到可变数组
        [arrM addObject:image];
    }
    
    //***第一种方式********
    /*
    // 给imageView设置动画的所有图片
    self.imageView.animationImages = arrM;
    // 动画时间
    self.imageView.animationDuration = arrM.count * 0.2;
    
    // 动画执行次数
    self.imageView.animationRepeatCount = 1;
    
    // 开始播放动画
    [self.imageView startAnimating];
    */
    //****************
    
    
    //***第二种方式********
    // 返回一种动画图片 "第一个参数表示要变成动画的所有图片 第二个参数表示动画时间"
    UIImage * animationImage =[UIImage animatedImageWithImages:arrM duration:arrM.count * 0.1];
    // 把动态图片设置到imageView上就可以动画了"直接就开始动画了"
    self.imageView.image = animationImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //这里不再是 self = [super init]...
    self.view = [[[NSBundle mainBundle]loadNibNamed:@"Zhen" owner:self options:nil]objectAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
