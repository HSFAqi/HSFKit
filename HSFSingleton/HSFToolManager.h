//
//  HSFToolManager.h
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "HSFSingleton.h"
#import <sys/utsname.h>
#import<CommonCrypto/CommonDigest.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>




@interface HSFToolManager : NSObject
///* 用于转场动画 */
//@property (strong, nonatomic) CEReversibleAnimationController *settingsAnimationController;
//@property (strong, nonatomic) CEReversibleAnimationController *navigationControllerAnimationController;
//@property (strong, nonatomic) CEBaseInteractionController *navigationControllerInteractionController;
//@property (strong, nonatomic) CEBaseInteractionController *settingsInteractionController;



/* 单例 */
HSFSingleton_h(HSFToolManager);


#pragma mark 实用方法
/* MD5加密 */
+ (NSString *)secureMD5WithString:(NSString *)string;

/* 获得版本号 */
+ (NSString *)getVersion;

/* 根据版本号判断是否显示引导页 */
+ (BOOL)showNewUserGuiderIfNeeded;

/* 更新(同步)本地存储的版本 */
+ (void)synchronizeLocalAppVersion;


#pragma mark -日期相关
/* 获取当月的天数 */
- (NSInteger)getNumberOfDaysInMonth;
/* 获取过去一周时间 数组 */
- (NSMutableArray *)getPastWeekDateStringArr;
/* 获取未来一周时间 数组 */
- (NSMutableArray *)getFeatureWeekDateStringArr;

#pragma mark -获取图片加载路径
-(NSString *)getNetImageUrlWith:(NSString *)path;

#pragma mark 获取本地图片视频信息
//获取照片data
- (NSDictionary *)getImageFromPHAsset:(PHAsset *)asset;
//获取视频data (兼顾了从 LivePhoto 里面提取视频文件)
- (NSDictionary *)getVideoFromPHAsset:(PHAsset *)asset;


#pragma mark 动画相关
//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount;
//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView;
//呼吸灯效果动画
-(void)addBLNAnimationOnView:(UIView *)animationView;

#pragma mark RunTime
#pragma mark RunTime
/* 获取对象的所有属性，不包括属性值 */
- (NSArray *)getAllProperties_with_obj:(id)someOBJ;
/* 获取对象的所有属性 以及属性值 */
- (NSDictionary *)properties_aps_with_obj:(id)someOBJ;
/* 获取对象的所有方法 */
-(void)printMothList_with_obj:(id)someOBJ;

#pragma mark 获取当前控制器
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;


#pragma mark 计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
/**
 *  计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
 *  iOS7下UIViewController.view是默认全屏的，要把这20像素考虑进去
 */
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v;


#pragma mark 跳转到登录页面
-(void)jumpToLoginVCFrom:(UIViewController *)fromVC;




@end
