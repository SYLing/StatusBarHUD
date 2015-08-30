//
//  YLHUD.h
//  StatusBarHUD
//
//  Created by 邵银岭 on 15/8/30.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLHUD : NSObject

/**
 *  展示消息
 *
 *  @param message 消息内容
 */
+ (void)showMessage:(NSString *)message Withimage:(NSString *)imageName;

/**
 *  隐藏消息展示
 *
 *  @param message 消息内容
 */
+ (void)hideMessage;

/**
 *  展示成功消息
 *
 *  @param message 消息内容
 */
+ (void)showSuccessMessage:(NSString *)message Withimage:(NSString *)imageName;

/**
 *  展示错误消息
 *
 *  @param message 消息内容
 */
+ (void)showErrorMessage:(NSString *)message Withimage:(NSString *)imageName;

@end
