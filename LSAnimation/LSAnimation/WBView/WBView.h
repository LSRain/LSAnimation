//
//  WBView.h
//  WBView
//
//  Created by WangBiao on 2016/11/14.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBView : UIView

@property(nonatomic,assign) BOOL isTimerStart;

- (void)setItems:(NSArray *)items;
- (void)timerStart;
- (void)timerStop;

@end
