//
//  HSFBaseTabBarControllerConfig.m
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFBaseTabBarControllerConfig.h"

#import "HSFBaseNavC.h"
/* 子控制器 */
/* 一级页面 */
#import "HSFHomeVC.h"
#import "HSFCategoryVC.h"
#import "HSFFindVC.h"
#import "HSFShoppingVC.h"
#import "HSFMineVC.h"




@interface HSFBaseTabBarControllerConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;
@property (nonatomic,strong) NSArray *viewControllers;
@property (nonatomic,strong) NSArray *tabBarItemsAttributesForController;

@end

@implementation HSFBaseTabBarControllerConfig





#pragma mark 懒加载
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);

        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment
                                                                                                 context:self.context
                                                 ];
        
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

/* 添加子控制器 */
-(NSArray *)viewControllers{
    //首页
    HSFHomeVC *vc1 = [[HSFHomeVC alloc] init];
    HSFBaseNavC *nav1 = [[HSFBaseNavC alloc] initWithRootViewController:vc1];
    //分类
    HSFCategoryVC *vc2 = [[HSFCategoryVC alloc] init];
    HSFBaseNavC *nav2 = [[HSFBaseNavC alloc] initWithRootViewController:vc2];
    //发现
    HSFFindVC *vc3 = [[HSFFindVC alloc] init];
    HSFBaseNavC *nav3 = [[HSFBaseNavC alloc] initWithRootViewController:vc3];
    //购物车
    HSFShoppingVC *vc4 = [[HSFShoppingVC alloc] init];
    HSFBaseNavC *nav4 = [[HSFBaseNavC alloc] initWithRootViewController:vc4];
    //我的
    HSFMineVC *vc5 = [[HSFMineVC alloc] init];
    HSFBaseNavC *nav5 = [[HSFBaseNavC alloc] initWithRootViewController:vc5];
    
    NSArray *viewControllers = @[
                                 nav1,
                                 nav2,
                                 nav3,
                                 nav4,
                                 nav5
                                 ];
    return viewControllers;
}

/* 设置 title+icon */
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *attributes1 = @{
                                           CYLTabBarItemTitle : @"首页",
                                           CYLTabBarItemImage : @"tab_home_nor",  /* NSString and UIImage are supported*/
                                           CYLTabBarItemSelectedImage : @"tab_home_sel", /* NSString and UIImage are supported*/
                                        };
    NSDictionary *attributes2 = @{
                                           CYLTabBarItemTitle : @"分类",
                                           CYLTabBarItemImage : @"tab_category_nor",  /* NSString and UIImage are supported*/
                                           CYLTabBarItemSelectedImage : @"tab_category_sel", /* NSString and UIImage are supported*/
                                           };
    NSDictionary *attributes3 = @{
                                      CYLTabBarItemTitle : @"发现",
                                      CYLTabBarItemImage : @"tab_find_nor",  /* NSString and UIImage are supported*/
                                      CYLTabBarItemSelectedImage : @"tab_find_sel", /* NSString and UIImage are supported*/
                                      };
    
    NSDictionary *attributes4 = @{
                                  CYLTabBarItemTitle : @"购物车",
                                  CYLTabBarItemImage : @"tab_shopping_nor",  /* NSString and UIImage are supported*/
                                  CYLTabBarItemSelectedImage : @"tab_shopping_sel", /* NSString and UIImage are supported*/
                                  };
    NSDictionary *attributes5 = @{
                                  CYLTabBarItemTitle : @"我的",
                                  CYLTabBarItemImage : @"tab_mine_nor",  /* NSString and UIImage are supported*/
                                  CYLTabBarItemSelectedImage : @"tab_mine_sel", /* NSString and UIImage are supported*/
                                  };
    
    NSArray *tabBarItemsAttributes = @[
                                       attributes1,
                                       attributes2,
                                       attributes3,
                                       attributes4,
                                       attributes5
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
//    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? (CYLTabBarControllerHeight+25) : CYLTabBarControllerHeight;
    tabBarController.tabBarHeight = k_HSFTabBarHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = k_tabFontColor_nor;
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = k_tabFontColor_sel;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //设置translucent
    tabBarAppearance.translucent = NO;
    
    //FIXED: #196
    UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
    //     [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}


- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = CYLTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor yellowColor]
                             size:selectionIndicatorImageSize]];
}



#pragma mark 实用方法
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
