//
//  AppDelegate+RootVC.m
//  ZMW
//
//  Created by 黄山锋 on 2018/3/22.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+RootVC.h"


//选项卡
#import "HSFBaseTabBarControllerConfig.h"
#import "CYLTabBarController.h"
//加号按钮
#import "HSFPlusBtn.h"


#import "HSFTabbarC.h"//使用系统的创建方法

@implementation AppDelegate (RootVC)

/* 设置主窗口,并设置根控制器 */
-(void)setUpRootVC{
//    [HSFPlusBtn registerPlusButton];//要先注册加号按钮(需要的话)
    HSFBaseTabBarControllerConfig *tabBarControllerConfig = [[HSFBaseTabBarControllerConfig alloc] init];
    self.tabBarController = tabBarControllerConfig.tabBarController;
    self.tabBarController.delegate = self;
    //    [self.window setRootViewController:self.tabBarController];
    [self customizeInterfaceWithTabBarController:self.tabBarController];//设置tabbar外观
    
//    //登录页面
//    LoginVC *vc = [[LoginVC alloc]init];
//    vc.isFirstClass = YES;
//    HSFBaseNavC *nav = [[HSFBaseNavC alloc]initWithRootViewController:vc];
    
    [self.window setRootViewController:self.tabBarController];
    
    
//    HSFTabbarC *tabC = [[HSFTabbarC alloc]init];
//    [self.window setRootViewController:tabC];
    
}



/* 设置tabbar外观 */
- (void)customizeInterfaceWithTabBarController:(CYLTabBarController *)tabBarController {
    //    [tabBarController hideTabBadgeBackgroundSeparator];//去除 TabBar 自带的顶部阴影（iOS10后）
    
    //    //添加小红点
    //    UIViewController *viewController = tabBarController.viewControllers[0];
    //    UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    //    [viewController.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
    //    [viewController cyl_showTabBadgePoint];
    //
    //    UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    //    @try {
    //        [tabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
    //        [tabBarController.viewControllers[1] cyl_showTabBadgePoint];
    //
    //        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    //        [tabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
    //        [tabBarController.viewControllers[2] cyl_showTabBadgePoint];
    //
    //        [tabBarController.viewControllers[3] cyl_showTabBadgePoint];
    //
    //        //添加提示动画，引导用户点击
    //        [[HSFToolManager sharedHSFToolManager] addScaleAnimationOnView:tabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20];
    //    } @catch (NSException *exception) {}
}

#pragma mark 代理方法
#pragma mark CYLTabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    
    if ([control cyl_isTabButton]) {
        //        //更改红标状态
        //        if ([[self cyl_tabBarController].selectedViewController cyl_isShowTabBadgePoint]) {
        //            [[self cyl_tabBarController].selectedViewController cyl_removeTabBadgePoint];
        //        } else {
        //            [[self cyl_tabBarController].selectedViewController cyl_showTabBadgePoint];
        //        }
        
        animationView = [control cyl_tabImageView];
    }
    
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if ([control cyl_isPlusButton]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    }
    [[HSFToolManager sharedHSFToolManager] addScaleAnimationOnView:animationView repeatCount:1];
//    [[HSFToolManager sharedHSFToolManager] addRotateAnimationOnView:animationView];
    
    //    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
    //        [[HSFToolManager sharedHSFToolManager] addScaleAnimationOnView:animationView repeatCount:1];
    //    } else {
    //        [[HSFToolManager sharedHSFToolManager] addRotateAnimationOnView:animationView];
    //    }
}





@end
