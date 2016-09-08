//
//  ViewController.m
//  CountDownButtonDemo
//
//  Created by HFY on 16/9/8.
//  Copyright © 2016年 zgcc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    CountDownButton *_cdBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
}

- (void)setupView{
    
    _cdBtn = [[CountDownButton alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
    _cdBtn.center = self.view.center;
    _cdBtn.delegate = self;
    [_cdBtn setTitle:@"点击倒计" forState:UIControlStateNormal];
    [_cdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _cdBtn.backgroundColor = [UIColor blackColor];
    [_cdBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cdBtn];
    
}

- (void)btnAction:(CountDownButton *)sender{
    
    [_cdBtn startCountDownWithM1:1 M2:0];
    
}

- (void)countDownTime:(int)time{
    NSLog(@"---%s %d", __FUNCTION__, time);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
