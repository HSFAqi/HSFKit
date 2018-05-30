//
//  HSFToolManager.m
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFToolManager.h"

#import <UIKit/UIKit.h>
#import "HSFSingleton.h"
#import <sys/utsname.h>
#import<CommonCrypto/CommonDigest.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>



/* 注意：要先导入ObjectC运行时头文件，以便调用runtime中的方法*/
#import <objc/runtime.h>

@implementation HSFToolManager

/* 单例 */
HSFSingleton_m(HSFToolManager);



#pragma mark 实用方法
/* MD5加密 */
+ (NSString *)secureMD5WithString:(NSString *)string {
    //加盐
    NSString *salt = @"uGUg*YIU98U*YIsdfas233245$#$%##657^&(&dugHY78^%7657^^98)u((*y9*9Y*&yGhJsdfasd23534tergkdfm1$%%fgcIY(*yt7^R&^8Y(*(HIHG8yyT&^t&^*98Y8546556&**^%^#%#@YTfgF6te%^$rew4w$#3@W7uY*";
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@",string];
    [str appendString:salt];
    
    const char *cStr = [str UTF8String];
    unsigned long length = strlen(cStr);
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)length, result);
    
    NSMutableString *secureString = [NSMutableString string];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [secureString appendFormat:@"%02X", result[i]];
    }
    
    return secureString;
}

/* 获得版本号 */
+ (NSString *)getVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return currentVersion;
}

/* 根据版本号判断是否显示引导页 */
+ (BOOL)showNewUserGuiderIfNeeded{
    //当前运行的版本
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    //本地保存的版本号
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [userDe objectForKey:kAPP_Version];
    if ([currentVersion isEqualToString:localVersion]) {
        //已经运行过该版本
        return NO;
    } else {
        //第一次运行该版本
        return YES;
    }
}

/* 更新(同步)本地存储的版本 */
+ (void)synchronizeLocalAppVersion{
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    [userDe setObject:currentVersion forKey:kAPP_Version];
    [userDe synchronize];
}


#pragma mark -日期相关
/* 获取当月的天数 */
- (NSInteger)getNumberOfDaysInMonth
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSGregorianCalendar - ios 8
    NSDate * currentDate = [NSDate date];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay  //NSDayCalendarUnit - ios 8
                                   inUnit: NSCalendarUnitMonth //NSMonthCalendarUnit - ios 8
                                  forDate:currentDate];
    return range.length;
}
/* 获取过去一周时间 数组 */
- (NSMutableArray *)getPastWeekDateStringArr{
    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 7; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = -i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"M月d日"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        //        NSString *dateStr = @"5月31日";
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        //组合时间
        //        NSString *strTime = [NSString stringWithFormat:@"%@(%@)",dateStr,weekStr];
        //        [eightArr addObject:strTime];
        
        [eightArr addObject:dateStr];
    }
    return eightArr;
}
/* 获取未来一周时间 数组 */
- (NSMutableArray *)getFeatureWeekDateStringArr{
    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 7; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"M月d日"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        //        NSString *dateStr = @"5月31日";
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        //组合时间
        //        NSString *strTime = [NSString stringWithFormat:@"%@(%@)",dateStr,weekStr];
        //        [eightArr addObject:strTime];
        
        [eightArr addObject:dateStr];
    }
    return eightArr;
}

//#pragma mark -获取图片加载路径
//-(NSString *)getNetImageUrlWith:(NSString *)path{
//    if (![path containsString:@"http"]) {
//        return [NSString stringWithFormat:@"%@%@",kBaseImageUrl,path];
//    }else{
//        return path;
//    }
//}

#pragma mark 获取本地图片视频信息
//获取照片data
- (NSDictionary *)getImageFromPHAsset:(PHAsset *)asset{
    __block NSData *data;
    PHAssetResource *resource = [[PHAssetResource assetResourcesForAsset:asset] firstObject];
    if (asset.mediaType == PHAssetMediaTypeImage) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.version = PHImageRequestOptionsVersionCurrent;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        options.synchronous = YES;
        [[PHImageManager defaultManager] requestImageDataForAsset:asset
                                                          options:options
                                                    resultHandler:
         ^(NSData *imageData,
           NSString *dataUTI,
           UIImageOrientation orientation,
           NSDictionary *info) {
             data = [NSData dataWithData:imageData];
         }];
    }
    if (data.length <= 0){
        return nil;
    }else{
        return @{@"data":data,
                 @"fileName":resource.originalFilename};
    }
}
//获取视频data (兼顾了从 LivePhoto 里面提取视频文件)
- (NSDictionary *)getVideoFromPHAsset:(PHAsset *)asset{
    NSArray *assetResources = [PHAssetResource assetResourcesForAsset:asset];
    PHAssetResource *resource;
    
    for (PHAssetResource *assetRes in assetResources) {
        if (assetRes.type == PHAssetResourceTypePairedVideo ||
            assetRes.type == PHAssetResourceTypeVideo) {
            resource = assetRes;
        }
    }
    NSString *fileName = @"tempAssetVideo.mov";
    if (resource.originalFilename) {
        fileName = resource.originalFilename;
    }
    __block NSDictionary *result = [NSDictionary dictionary];
    if (asset.mediaType == PHAssetMediaTypeVideo || asset.mediaSubtypes == PHAssetMediaSubtypePhotoLive) {
        PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
        options.version = PHImageRequestOptionsVersionCurrent;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        
        NSString *PATH_MOVIE_FILE = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
        [[NSFileManager defaultManager] removeItemAtPath:PATH_MOVIE_FILE error:nil];
        
        [[PHAssetResourceManager defaultManager] writeDataForAssetResource:resource
                                                                    toFile:[NSURL fileURLWithPath:PATH_MOVIE_FILE]
                                                                   options:nil
                                                         completionHandler:^(NSError * _Nullable error) {
                                                             if (error) {
                                                                 result = nil;
                                                             } else {
                                                                 
                                                                 NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:PATH_MOVIE_FILE]];
                                                                 
                                                                 result = @{@"data":data,
                                                                            @"fileName":resource.originalFilename};
                                                             }
                                                             [[NSFileManager defaultManager] removeItemAtPath:PATH_MOVIE_FILE  error:nil];
                                                         }];
    } else {
        result = nil;
    }
    
    return result;
}



#pragma mark 动画相关
//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}

//呼吸灯效果动画
-(void)addBLNAnimationOnView:(UIView *)animationView {
    // 缩放动画
    CABasicAnimation * scaleAnim = [CABasicAnimation animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.fromValue = @1;
    scaleAnim.toValue = @1.3;
    scaleAnim.duration = 2;
    // 透明度动画
    CABasicAnimation *opacityAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue= @1;
    opacityAnim.toValue= @0.1;
    opacityAnim.duration= 2;
    // 创建动画组
    CAAnimationGroup *groups =[CAAnimationGroup animation];
    groups.animations = @[scaleAnim,opacityAnim];
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.duration = 2;
    groups.repeatCount = FLT_MAX;
    
    [animationView.layer addAnimation:groups forKey:@"groups"];
}


#pragma mark RunTime
/* 获取对象的所有属性，不包括属性值 */
- (NSArray *)getAllProperties_with_obj:(id)someOBJ
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([someOBJ class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

/* 获取对象的所有属性 以及属性值 */
- (NSDictionary *)properties_aps_with_obj:(id)someOBJ
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([someOBJ class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [someOBJ valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

/* 获取对象的所有方法 */
-(void)printMothList_with_obj:(id)someOBJ
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([someOBJ class],&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
        IMP imp_f = method_getImplementation(temp_f);
        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
        int arguments = method_getNumberOfArguments(temp_f);
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}

#pragma mark 获取当前控制器
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    }
    else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    }
    else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}


#pragma mark 计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
/**
 *  计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
 *  iOS7下UIViewController.view是默认全屏的，要把这20像素考虑进去
 */
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v
{
    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (!iOS7) {
        screenHeight -= 20;
    }
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}





#pragma mark 跳转到登录页面
-(void)jumpToLoginVCFrom:(UIViewController *)fromVC{
    
}









@end
