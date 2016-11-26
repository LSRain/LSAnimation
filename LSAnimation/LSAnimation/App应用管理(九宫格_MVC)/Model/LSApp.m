//
//  LSApp.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//


#import "LSApp.h"

@implementation LSApp
+ (instancetype)appWithDict:(NSDictionary *)dict {
    // 创建模型对象
   LSApp *app = [[LSApp alloc] init];
//    app.name = dict[@"name"];
//    app.icon = dict[@"icon"];
    
    // KVC 可以批处理操作/可以简化代码  Key Value Coding 键值编码
    [app setValuesForKeysWithDictionary:dict];
    
    return app;
}
@end
