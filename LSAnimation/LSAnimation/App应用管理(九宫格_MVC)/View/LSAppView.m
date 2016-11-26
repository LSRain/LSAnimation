//
//  LSAppView.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "LSAppView.h"
#import "LSApp.h"

@interface LSAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation LSAppView


+ (instancetype)appView {
    // 第二种加载xib的方式
    // 加载nib文件"此加载xib的方式做的内存优化处理所以苹果建议使用下面方式加载"
    UINib *nib = [UINib nibWithNibName:@"LSAppView" bundle:nil];
    // 实例化nib文件
    LSAppView *appView = [[nib instantiateWithOwner:nil options:nil] firstObject];
    
    return appView;
}

- (void)setApp:(LSApp *)app {
    _app = app;
    
    self.imageView.image = [UIImage imageNamed:app.icon];
    self.nameLabel.text = app.name;
                            
}

@end
