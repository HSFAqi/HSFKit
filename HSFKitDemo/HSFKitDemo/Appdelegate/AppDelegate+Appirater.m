//
//  AppDelegate+Appirater.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/29.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+Appirater.h"

@implementation AppDelegate (Appirater)
/* 设置Appirater(去App Store评分) */
-(void)configAppirater{
    
    //应用的APPID
    [Appirater setAppId:kAppID];
    //用户安装这个应用多少天之后 才是计算
    [Appirater setDaysUntilPrompt:10];
    //用户启动多少次之后 开始弹出
    [Appirater setUsesUntilPrompt:10];
    //对于特定事件处理  -1
    [Appirater setSignificantEventsUntilPrompt:-1];
    //用户没有评分的话 多久再提醒一次
    [Appirater setTimeBeforeReminding:2];
    
    [Appirater setDelegate:self];
    [Appirater setOpenInAppStore:YES];
    
    
    [Appirater setCustomAlertTitle:[NSString stringWithFormat:@"为%@评分",kAppName]];
    [Appirater setCustomAlertMessage:[NSString stringWithFormat:@"如果您觉得%@很好用，去App Store为它评分吧！",kAppName]];
    [Appirater setCustomAlertCancelButtonTitle:@"不了，谢谢"];
    [Appirater setCustomAlertRateLaterButtonTitle:@"稍后再说"];
    [Appirater setCustomAlertRateButtonTitle:@"现在去评分"];
    
    
    //Debug调试，每一次都可以调出来 上线需要设置成NO
    [Appirater setDebug:YES];
    
    //didFinishLaunchingWithOptions 最后调的 告诉 Appirater应用启动了
    [Appirater appLaunched:YES];
}


#pragma mark AppiraterDelegate
//是否显示
-(BOOL)appiraterShouldDisplayAlert:(Appirater *)appirater{
    return YES;
}
//已经显示
-(void)appiraterDidDisplayAlert:(Appirater *)appirater{
    NSLog(@"已经显示");
}
//谢绝
-(void)appiraterDidDeclineToRate:(Appirater *)appirater{
    NSLog(@"谢绝");
}
//点击评分
-(void)appiraterDidOptToRate:(Appirater *)appirater{
    NSLog(@"点击评分");
}
//点击稍后评分
-(void)appiraterDidOptToRemindLater:(Appirater *)appirater{
    NSLog(@"点击稍后评分");
}
//将要显示
-(void)appiraterWillPresentModalView:(Appirater *)appirater animated:(BOOL)animated{
    
}
//消失
-(void)appiraterDidDismissModalView:(Appirater *)appirater animated:(BOOL)animated{
    
}



@end
