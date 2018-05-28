//
//  UIImage+VideoImage.h
//  HCJ
//
//  Created by 黄山锋 on 2017/11/20.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VideoImage)

+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

@end
