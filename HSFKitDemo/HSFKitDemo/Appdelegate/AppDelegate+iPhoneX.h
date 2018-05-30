//
//  AppDelegate+iPhoneX.h
//  HSFBuyer
//
//  Created by 黄山锋 on 2018/5/7.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (iPhoneX)

/* 注释
 Q:我要写多少行代码适配iPhone X？
 A:目前发现所有的Scrollview 及其子类都需要设置 contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever ，工程中大量使用列表的同学不要慌，不要忙，因为UIView及其子类都遵循UIAppearance协议，我们可以进行全局配置：
 */
-(void)iPhoneXAdapter;

@end
