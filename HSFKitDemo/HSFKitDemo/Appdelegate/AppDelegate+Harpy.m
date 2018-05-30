//
//  AppDelegate+Harpy.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/29.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+Harpy.h"

@implementation AppDelegate (Harpy)

/* 配置Harpy */
-(void)configHarpy{
    [[Harpy sharedInstance] setPresentingViewController:self.window.rootViewController];
    [[Harpy sharedInstance] setDelegate:self];
    [[Harpy sharedInstance] setShowAlertAfterCurrentVersionHasBeenReleasedForDays:3];
    [[Harpy sharedInstance] setAlertControllerTintColor:k_themeColor];
    [[Harpy sharedInstance] setAppName:kAppName];
    [[Harpy sharedInstance] setAlertType:HarpyAlertTypeSkip];
    
    
    [[Harpy sharedInstance] checkVersion];
}


#pragma mark HarpyDelegate
// 用户界面展示升级提示对话框
- (void)harpyDidShowUpdateDialog{
    
}

// 用户已经点击升级按钮并且进入到App Sotore
- (void)harpyUserDidLaunchAppStore{
    
}

// 用户已经点击跳过此次版本更新
- (void)harpyUserDidSkipVersion{
    
}

// 用户已经点击取消更行对话框
- (void)harpyUserDidCancel{
    
}




@end
