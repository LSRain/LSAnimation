//
//  LSAppView.h
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

/** 管理xib的类应该做两件事情
 1.把子控件赋值的细节封装在此类中"定义一个属性让外界传入数据,并且重写属性set方法,在此方法给子控件设置数据"
 2.把加载xib创建appView的细节也封装在此类中,提供一个类方法
 
 */
#import <UIKit/UIKit.h>
@class LSApp;

@interface LSAppView : UIView


// 让控制器给view传数据过来
@property (nonatomic, strong) LSApp *app;

#pragma mark - 视图创建细节"加载xib创建appView"
+ (instancetype)appView;
@end
