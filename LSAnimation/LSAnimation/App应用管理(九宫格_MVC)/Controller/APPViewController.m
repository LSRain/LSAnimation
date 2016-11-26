//
//  APPViewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "APPViewController.h"
#import "LSAppView.h"
#import "LSApp.h"

@interface APPViewController ()

@end

@implementation APPViewController {
    NSArray *_appsData;
}
/**
 // 第一种加载方式:1.加载xib来创建app应用界面
 // 通过xib创建出来的界面是有大小的"大小由xib中看的的控件的大小"
 //   UIView *appView = [[[NSBundle mainBundle] loadNibNamed:@"LSAppView" owner:nil options:nil] firstObject];
 
 
 
 // 第二种加载xib的方式
 // 加载nib文件"此加载xib的方式做的内存优化处理所以苹果建议使用下面方式加载"
 UINib *nib = [UINib nibWithNibName:@"LSAppView" bundle:nil];
 // 实例化nib文件
 UIView *appView = [[nib instantiateWithOwner:nil options:nil] firstObject];
 
 [self.view addSubview:appView];
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载数据
    _appsData = [self loadAppData];
    
    [self setupUI];
}

#pragma mark - 初始化UI
- (void)setupUI {
    
    // 实例化appView想要拿到它的尺寸
    LSAppView *appView = [LSAppView appView];
    
    // 定义列数
    NSInteger columnCount = 3;
    CGFloat appW = appView.bounds.size.width;
    CGFloat appH = appView.bounds.size.height;
    
    // 计算平均的间距
    CGFloat margin = (self.view.bounds.size.width - (columnCount * appW)) / (columnCount + 1);
    for (NSInteger i = 0; i < _appsData.count; i++) {
        
        // 创建appView
        LSAppView *appView = [LSAppView appView];
        
        // 计算列号 == 第几个格子 % 列数
        NSInteger col = i % columnCount;
        
        // 计算X == 左边间距  + (格子的宽  + 格子之间间距) * 列号
        CGFloat appX = margin + (appW + margin) * col;
        
        // 计算行号 = 第几个格子 / 列数
        NSInteger row = i / columnCount;
        
        // 计算Y = 顶部间距 + (格子的高  + 格子纵向间距) * 行号
        CGFloat appY = margin + (appH + margin) * row;
        
        
        
        // 设置appView的frame
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        
        // 获取每一个appView对应的数据并且传给appView中的属性,就会调用它的set方法去设置数据了
        appView.app = _appsData[i];
        
        // 把装配好的appView添加到控制器的view上
        [self.view addSubview:appView];
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


#pragma mark - 加载数据
- (NSArray *)loadAppData {
    // 1.获取plist文件路径
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    // 2.加载plist
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:url];
    
    // 3.创建可变数组用来保存每一个模型对象
    NSMutableArray *arrM = [NSMutableArray array];
    // 4.for循环遍历字典数组,把每一个字典转换成一个个的模型对象
    for (NSDictionary *dict in dictArr) {
        // 把字典中的数组赋值给app模型中的属性上
        LSApp *app = [LSApp appWithDict:dict];
        // 把模型添加到可变数组中保存
        [arrM addObject:app];
    }
    
    
    // 返回模型数组
    return arrM;
    
}

@end
