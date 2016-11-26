//
//  WBPoint.h
//  WBView
//
//  Created by WangBiao on 2016/11/14.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#ifndef WBPoint_h
#define WBPoint_h

struct WBPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};

typedef struct WBPoint WBPoint;

WBPoint WBPointMake(CGFloat x, CGFloat y, CGFloat z) {
    WBPoint point;
    point.x = x;
    point.y = y;
    point.z = z;
    return point;
}

#endif /* WBPoint_h */
