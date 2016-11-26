//
//  LSApp.h
//  LSAnimation
//
//  Created by WangBiao on 2016/11/26.
//  Copyright © 2016年 lsrain. All rights reserved.
//

/**
 用来保存数"来实现字典转模型"
 */

#import <Foundation/Foundation.h>

@interface LSApp : NSObject
/**
 用来保存应用名称
 */
@property (nonatomic, copy) NSString *name;
/**
 用来保存图片名称
 */
@property (nonatomic, copy) NSString *icon;


+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
