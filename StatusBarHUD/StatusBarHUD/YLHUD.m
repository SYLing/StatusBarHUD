//
//  YLHUD.m
//  StatusBarHUD
//
//  Created by 邵银岭 on 15/8/30.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "YLHUD.h"
#import <UIKit/UIKit.h>

static UIWindow *hudWindow = nil;
static NSTimer *timer = nil;

@implementation YLHUD

#pragma mark 辅助方法
// 创建窗口显示
+ (void)showWindow
{
    // 创建指示器
    hudWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, - 20, [UIScreen mainScreen].bounds.size.width, 20)];
    // 设置背景色
    hudWindow.backgroundColor = [UIColor grayColor];
    // 设置等级
    hudWindow.windowLevel = UIWindowLevelAlert;
    // 显示窗口
    hudWindow.hidden = NO;
}
// 添加内容
+(void)showMessage:(NSString *)message imageName:(NSString *)image{
    // btn
    UIButton *contentBtn = [[UIButton alloc] init];
    [contentBtn setTitle:message forState:UIControlStateNormal];
    
    // 设置图片
    if (image) {
         [contentBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    contentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    contentBtn.frame = hudWindow.bounds;
    [hudWindow addSubview:contentBtn];
    
}

// 动画
+(void)startAnimation{
    
    [UIView animateWithDuration:0.25 animations:^{
        hudWindow.transform = CGAffineTransformTranslate(hudWindow.transform, 0, 20);
    }];
}

// 定时器
+(void)startTimer{
    // 开启定时器之前，要把以前的定时器取消
    [timer invalidate];
    
    // 开启新的定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideMessage) userInfo:nil repeats:NO];
    
}

#pragma mark 执行方法
+ (void)showMessage:(NSString *)message Withimage:(NSString *)imageName
{
    // 设置窗口
    [self showWindow];

    // 设置内容
    [self showMessage:message imageName:nil];

    // 显示
    [self startAnimation];
}

+(void)hideMessage;
{
    [UIView animateWithDuration:0.25 animations:^{
        hudWindow.transform = CGAffineTransformTranslate(hudWindow.transform, 0, -20);
    } completion:^(BOOL finished) {
        hudWindow = nil;
    }];
}

+ (void)showSuccessMessage:(NSString *)message Withimage:(NSString *)imageName
{
    
    // 显示信息
    [self showWindow];
    
    // 设置文字和图片
    if (imageName) {
        [self showMessage:message imageName:imageName];
    }else{
        [self showMessage:message imageName:@"YLStatusBarHUD.bundle/success"];
    }
    
    // 执行动画
    [self startAnimation];
    
    // 添加定时器，2秒后，hud要消失
    
    [self startTimer];
}

+(void)showErrorMessage:(NSString *)message Withimage:(NSString *)imageName
{
    // 显示信息
    [self showWindow];
    
    // 设置文字和图片
    if (imageName) {
        [self showMessage:message imageName:imageName];
    }else{
        [self showMessage:message imageName:@"YLStatusBarHUD.bundle/error"];
    }
    
    // 执行动画
    [self startAnimation];
    
    // 添加定时器，2秒后，hud要消失
    
    [self startTimer];
  
}
@end
