//
//  AppDelegate+iPhoneX.m
//  HSFBuyer
//
//  Created by 黄山锋 on 2018/5/7.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+iPhoneX.h"

@implementation AppDelegate (iPhoneX)

/* 注释
我要写多少行代码适配iPhone X
 */
-(void)iPhoneXAdapter{
    // AppDelegate 进行全局设置
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

@end
