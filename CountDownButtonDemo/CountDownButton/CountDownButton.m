//
//  CountDownButton.m
//  NumberMorpViewDemo
//
//  Created by HFY on 16/9/1.
//  Copyright © 2016年 snewflyedu. All rights reserved.
//

#import "CountDownButton.h"
#import <CountDownButtonDemo-Swift.h>

@interface CountDownButton (){
    NumberMorphView *_n1;
    NumberMorphView *_n2;
    int _m1;
    int _m2;
    NSTimer *_timer;
    NSString *_title;
}
@end

@implementation CountDownButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)startCountDownWithM1:(int)m1 M2:(int)m2{
    
    _title = self.currentTitle;
    [self setTitle:nil forState:UIControlStateNormal];
    
    [self setEnabled:NO];
    
    _m1 = m1;
    _m2 = m2;
    
    _n1 = [[NumberMorphView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 4, 0, self.bounds.size.width / 4, self.bounds.size.height)];
    _n1.userInteractionEnabled = NO;
    _n1.fontColor = self.currentTitleColor;
    _n1.currentDigit = _m1;
    [self addSubview:_n1];
    
    _n2 = [[NumberMorphView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 4, self.bounds.size.height)];
    _n2.userInteractionEnabled = NO;
    _n2.fontColor = self.currentTitleColor;
    _n2.currentDigit = _m2;
    [self addSubview:_n2];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateNumber) userInfo:nil repeats:YES];
    
}

- (void)updateNumber{
    
    if (_m1 == 0 && _m2 == 0) {
        
        [_timer invalidate];
        _timer = nil;
        
        [self setTitle:_title forState:UIControlStateNormal];
        
        _n1.fontColor = [UIColor clearColor];
        _n2.fontColor = [UIColor clearColor];
        
        [self setEnabled:YES];
        
    }else{
        if (_m2 == 0) {
            _m2 = 9;
            if (_m1 != 0) {
                _m1--;
            }
        }else{
            _m2--;
        }
    }
    
    _n1.nextDigit = _m1;
    _n2.nextDigit = _m2;
    
    if ([_delegate respondsToSelector:@selector(countDownTime:)]) {
        [_delegate countDownTime:[NSString stringWithFormat:@"%d%d", _m1, _m2].integerValue];
    }
    
}

@end
