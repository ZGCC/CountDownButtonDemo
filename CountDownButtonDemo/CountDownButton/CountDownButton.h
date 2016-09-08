//
//  CountDownButton.h
//  NumberMorpViewDemo
//
//  Created by HFY on 16/9/1.
//  Copyright © 2016年 snewflyedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountDownDelegate <NSObject>

@optional
- (void)countDownTime:(int)time;

@end

@interface CountDownButton : UIButton

/*
 m1: 十位
 m2: 个位
 */

@property (nonatomic, strong) id<CountDownDelegate> delegate;

- (void)startCountDownWithM1:(int)m1 M2:(int)m2;

@end
