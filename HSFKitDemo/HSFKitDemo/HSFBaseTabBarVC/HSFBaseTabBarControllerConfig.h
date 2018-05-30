//
//  HSFBaseTabBarControllerConfig.h
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CYLTabBarController.h"

static CGFloat const CYLTabBarControllerHeight = 50.f;

@interface HSFBaseTabBarControllerConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
