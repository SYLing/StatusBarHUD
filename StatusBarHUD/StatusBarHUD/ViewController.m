//
//  ViewController.m
//  StatusBarHUD
//
//  Created by 邵银岭 on 15/8/30.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "ViewController.h"
#import "YLHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// 展示消息
- (IBAction)showMessage:(id)sender {
    [YLHUD showMessage:@"我在问你，吃饭了吗？" Withimage:nil];
}

// 隐藏消息
- (IBAction)hideMessage:(id)sender {
    [YLHUD hideMessage];
}
// 成功提示
- (IBAction)success:(id)sender {
    [YLHUD showSuccessMessage:@"我靠，屌爆了" Withimage:nil];
}

// 错误提示
- (IBAction)showError:(id)sender {
    [YLHUD showErrorMessage:@"我靠，蛋疼了" Withimage:nil];
}
@end
