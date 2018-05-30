//
//  AppDelegate+SDK.h
//  ZMW
//
//  Created by 黄山锋 on 2018/3/22.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (SDK)

#pragma mark Bugly
-(void)setUpSDK_Bugly;

#pragma mark -配置键盘
-(void)setUpSDK_IQKeyboardManager;

#pragma mark 友盟
-(void)setUpSDK_UMeng;

@end
