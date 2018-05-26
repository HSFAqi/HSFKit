//
//  HSFBaseItem.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/26.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFBaseItem.h"

@implementation HSFBaseItem

//获取重用标识符
+(NSString *)getReuseIdentifier{
    return NSStringFromClass([self class]);
}

@end
