//
//  AppDelegate+WRNavigationBar.m
//  HSFBuyer
//
//  Created by 黄山锋 on 2018/5/16.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+WRNavigationBar.h"

@implementation AppDelegate (WRNavigationBar)

/* 设置导航栏外观 */
- (void)setUpNavBarAppearence
{
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor purpleColor]}];
    //    [UINavigationBar appearance].tintColor = [UIColor yellowColor];
    //    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    
    
    [UINavigationBar appearance].translucent = NO;
    //设置导航栏文字字体大小 文字的颜色
    if (kStringIsEmpty(k_fontName)) {
        if (@available(iOS 8.2, *)) {
            [[UINavigationBar appearance] setTitleTextAttributes:
             @{NSFontAttributeName:[UIFont systemFontOfSize:k_fontSize_bigHead weight:k_fontWeight],
               NSForegroundColorAttributeName:k_navFontColor_nor}];
        } else {
            [[UINavigationBar appearance] setTitleTextAttributes:
             @{NSFontAttributeName:[UIFont fontWithName:k_fontName size:k_fontSize_bigHead],
               NSForegroundColorAttributeName:k_navFontColor_nor}];
        }
    }else{
        [[UINavigationBar appearance] setTitleTextAttributes:
         @{NSFontAttributeName:[UIFont fontWithName:k_fontName size:k_fontSize_bigHead],
           NSForegroundColorAttributeName:k_navFontColor_nor}];
    }
    
    
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
                                       @"TZPhotoPickerController",
                                       @"TZGifPhotoPreviewController",
                                       @"TZAlbumPickerController",
                                       @"TZPhotoPreviewController",
                                       @"TZVideoPlayerController"]];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:k_themeColor];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:k_navFontColor_nor];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:k_navFontColor_nor];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
    
}


@end
