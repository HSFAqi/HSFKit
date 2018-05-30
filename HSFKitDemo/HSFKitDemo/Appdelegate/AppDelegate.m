//
//  AppDelegate.m
//  HSFBuyer
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate.h"


//设置跟控制器
#import "AppDelegate+RootVC.h"
//扩展
#import "AppDelegate+SDK.h"
//启动页广告
#import "AppDelegate+ADLaunch.h"
//新手引导页
#import "AppDelegate+NewUserGuider.h"
//适配iPhone X
#import "AppDelegate+iPhoneX.h"
//导航栏外观
#import "AppDelegate+WRNavigationBar.h"
//去App Store评分
#import "AppDelegate+Appirater.h"
//版本更新
#import "AppDelegate+Harpy.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    /* 新建keyWindow */
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.window makeKeyAndVisible];
//    
//    /* 配置SDK */
//    [self setUpSDK_IQKeyboardManager];//配置键盘
//    [self setUpSDK_Bugly];//Bugly
//    [self setUpSDK_UMeng];//友盟
//    
//    
//    /* 设置主窗口,并设置根控制器 */
//    [self setUpRootVC];
//    
//    
//    
//    /* 新手引导页 */
//    [self showNewUserGuiderIfNeeded];
//    /* 启动页广告 */
//    [self setupXHLaunchAd];
//    /* 设置Appirater */
//    [self configAppirater];
//    /* 配置版本更新 */
//    [self configHarpy];
//    /* 适配iPhone X */
//    [self iPhoneXAdapter];
//    /* 设置导航栏外观 */
//    [self setUpNavBarAppearence];
    
    return YES;
}


#pragma mark -LifeCycle
//App将要进入前台
- (void)applicationWillResignActive:(UIApplication *)application {
    
}
//App已经进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*执行app新版本检测
     执行每天检测你的app是否需要更新版本，需要在`applicationDidBecomeActive:`执行最合适
     因为这对于的你的应用进如后台很长时间后非常有用。
     同时，也会在应用第一次启动时执行版本检测
     */
    [[Harpy sharedInstance] checkVersionDaily];
    /*执行app新版本检测
     执行每周检测你的app新版本。同理需要将此代码放置在`applicationDidBecomeActive:`中执行。
     同时，也会在应用第一次启动时执行版本检测
     */
    [[Harpy sharedInstance] checkVersionWeekly];

}
//App将要进入后台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    /* 设置Appirater */
    [Appirater appEnteredForeground:YES];
    
    /*执行app新版本检测
     执行app新版本检测，放在此是为了让用户从App Sore跳转回来并重新从后台进入你的
     app，并且没有在从App Store中跳转回来之前更新他们app的时候调用
     注意：只有当你使用*HarpyAlertTypeForce*样式弹框类型是才使用这种方法
     并且会在你第一次启动应用时检测。
     */
    [[Harpy sharedInstance] checkVersion];
    
}
//App已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}
//App将要退出
- (void)applicationWillTerminate:(UIApplication *)application {
    
}
//App内存警告
-  (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"系统内存不足");
}


#pragma mark -设置系统回调
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    //友盟回调
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        return YES;
    }
    return result;
}
// NOTE: 9.0以后使用新API接口 （支付宝）
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    //友盟回调
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        return YES;
    }
    return result;
}

//低版本的调用这个方法
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    //友盟回调
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        return YES;
    }
    return result;
}

@end
