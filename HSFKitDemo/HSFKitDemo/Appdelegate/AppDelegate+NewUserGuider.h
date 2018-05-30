//
//  AppDelegate+NewUserGuider.h
//  ZMW
//
//  Created by 黄山锋 on 2018/3/22.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (NewUserGuider)<EAIntroDelegate>

#pragma mark /*新手引导页*/
-(void)showNewUserGuiderIfNeeded;

@end
