//
//  HSFTabbarC.m
//  NovelDemo
//
//  Created by 黄山锋 on 2018/1/15.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFTabbarC.h"

/* 一级页面 */
#import "HSFHomeVC.h"
#import "HSFCategoryVC.h"
#import "HSFFindVC.h"
#import "HSFShoppingVC.h"
#import "HSFMineVC.h"

@interface HSFTabbarC ()

@end

@implementation HSFTabbarC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.translucent = NO;
    
    
    HSFHomeVC *vc1 = [[HSFHomeVC alloc]init];
    HSFCategoryVC *vc2 = [[HSFCategoryVC alloc]init];
    HSFFindVC *vc3 = [[HSFFindVC alloc]init];
    HSFShoppingVC *vc4 = [[HSFShoppingVC alloc]init];
    HSFMineVC *vc5 = [[HSFMineVC alloc]init];
    
    [self addChildVC:vc1 title:@"首页" image:@"tab_home_nor" selectedImage:@"tab_home_sel"];
    [self addChildVC:vc2 title:@"分类" image:@"tab_category_nor" selectedImage:@"tab_category_sel"];
    [self addChildVC:vc3 title:@"发现" image:@"tab_find_nor" selectedImage:@"tab_find_sel"];
    [self addChildVC:vc4 title:@"购物车" image:@"tab_shopping_nor" selectedImage:@"tab_shopping_sel"];
    [self addChildVC:vc5 title:@"我的" image:@"tab_mine_nor" selectedImage:@"tab_mine_sel"];
    
}





/**
 *  添加一个子控制器
 *
 *  @param childVC       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVC.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVC.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 禁用图片渲染
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : k_tabFontColor_nor} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : k_themeColor} forState:UIControlStateSelected];
    
    // 为子控制器包装导航控制器
    HSFBaseNavC *nav = [[HSFBaseNavC alloc] initWithRootViewController:childVC];
    nav.navigationBar.barTintColor = k_themeColor;
    // 添加子控制器
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
