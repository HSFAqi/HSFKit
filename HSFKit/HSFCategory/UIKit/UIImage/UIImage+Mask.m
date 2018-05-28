//
//  UIImage+Mask.m
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/9/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "UIImage+Mask.h"

@implementation UIImage (Mask)

+ (UIImage *)addMaskImage:(UIImage *)maskImage inOriginImage:(UIImage *)originImage
{
    UIGraphicsBeginImageContext(originImage.size);
    
    //Draw originImage
    [originImage drawInRect:CGRectMake(0, 0, originImage.size.width, originImage.size.height)];
    
    //Draw maskImage
    [maskImage drawInRect:CGRectMake(originImage.size.width/2 - maskImage.size.width/2, originImage.size.height/2 - maskImage.size.height/2, maskImage.size.width, maskImage.size.height)];
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}


//给图片添加alpha通道
- (CGImageRef)CopyImageAndAddAlphaChannel:(CGImageRef)sourceImage
{
    CGImageRef retVal = NULL;
    
    size_t width = CGImageGetWidth(sourceImage);
    size_t height = CGImageGetHeight(sourceImage);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL, width, height,
                                                          8, 0, colorSpace, kCGImageAlphaPremultipliedFirst);
    
    if (offscreenContext != NULL)
    {
        CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), sourceImage);
        retVal = CGBitmapContextCreateImage(offscreenContext);
        CGContextRelease(offscreenContext);
    }
    
    CGColorSpaceRelease(colorSpace);
    
    return retVal;
}
//给image添加mask
+ (UIImage*)maskImage:(UIImage *)image withMask:(UIImage *)maskImage
{
    CGImageRef maskRef = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef sourceImage = [image CGImage];
    CGImageRef imageWithAlpha = sourceImage;
    //add alpha channel for images that don't have one (ie GIF, JPEG, etc...)
    //this however has a computational cost
    if (CGImageGetAlphaInfo(sourceImage) == kCGImageAlphaNone)
    {
//        imageWithAlpha = [self CopyImageAndAddAlphaChannel:sourceImage];
    }
    
    CGImageRef masked = CGImageCreateWithMask(imageWithAlpha, mask);
    CGImageRelease(mask);
    
    //release imageWithAlpha if it was created by CopyImageAndAddAlphaChannel
    if (sourceImage != imageWithAlpha)
    {
        CGImageRelease(imageWithAlpha);
    }
    
    UIImage* retImage = [UIImage imageWithCGImage:masked];
    CGImageRelease(masked);
    
    return retImage;
}

+ (CGImageRef)maskableImageRefConvertFrom:(CGImageRef)sourceImage
{
    CGImageRef retVal = NULL;
    
    size_t width = CGImageGetWidth(sourceImage);
    size_t height = CGImageGetHeight(sourceImage);
    
    //CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL,
                                                          width,
                                                          height,
                                                          8,
                                                          0,
                                                          colorSpace,
                                                          kCGBitmapByteOrderDefault | kCGImageAlphaNone);
    
    if (offscreenContext != NULL)
    {
        
        CGContextSetFillColorWithColor(offscreenContext, [UIColor whiteColor].CGColor);
        CGContextFillRect(offscreenContext, CGRectMake(0, 0, width, height));
        
        CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), sourceImage);
        retVal = CGBitmapContextCreateImage(offscreenContext);
        CGContextRelease(offscreenContext);
    }
    
    CGColorSpaceRelease(colorSpace);
    
    return retVal;
}

@end
