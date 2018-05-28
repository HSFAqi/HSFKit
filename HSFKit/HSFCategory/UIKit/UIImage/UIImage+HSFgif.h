//
//  UIImage+HSFgif.h
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/11/3.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HSFgif)
//+ (UIImage *)sd_animatedGIFWithData:(NSData *)data;//（SDWebImage里面已经有了）

+ (UIImage *)sd_animatedGIFNamed:(NSString *)name;

- (UIImage *)sd_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
