//
//  UIImage+Mask.h
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/9/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)
+ (UIImage *)addMaskImage:(UIImage *)maskImage inOriginImage:(UIImage *)originImage;
//给图片添加alpha通道
- (CGImageRef)CopyImageAndAddAlphaChannel:(CGImageRef)sourceImage;

+ (UIImage*)maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (CGImageRef)maskableImageRefConvertFrom:(CGImageRef)sourceImage;


/*
 注意事项：被遮罩的图片理论上是需要有透明通道的图片，这样遮罩之后才会达到一部分透明一部分不透明的效果，上述方法已经做了此项工作，所以不用担心。
 最重要的部分，作为遮罩的图片，在这种使用方法下必须没有透明通道，无论是png，jpg或者其他格式，有了透明通道，将达不到想要的效果，可能会出现完全透明的情况。如果有透明通道，则可以通过maskableImageRefConvertFrom方法稍加修正，对于一般情况都没有问题另外纯白色表示被遮罩区域将完全透明，纯黑色表示被遮罩区域将会原封不动保留下来，灰色部分(0x000000~0xFFFFFF)表示被遮罩区域将会处理成半透明的效果。
 */

@end
