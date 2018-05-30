//
//  HSFWebVC.h
//  ZMW
//
//  Created by 黄山锋 on 2018/3/20.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <TOWebViewController/TOWebViewController.h>

@interface HSFWebVC : TOWebViewController


#pragma mark 返回
@property (nonatomic,assign) BackType curBackType;
@property (nonatomic,assign) BOOL isFirstClass;//一级页面时隐藏返回按钮
-(void)goBack;

#pragma mark 导航栏左边
-(void)setNavLeftTitles:(NSArray *)titles colors:(NSArray *)colors;
-(void)setNavLeftIcons:(NSArray *)icons;
-(void)setNavLeftViews:(NSArray *)views;
//点击导航栏左边的方法
-(void)navLeftItemsACTION:(UIBarButtonItem *)sender;

#pragma mark 导航栏右边
-(void)setNavRightTitles:(NSArray *)titles colors:(NSArray *)colors;
-(void)setNavRightIcons:(NSArray *)icons;
-(void)setNavRightViews:(NSArray *)views;
//点击导航栏右边的方法
-(void)navRightItemsACTION:(UIBarButtonItem *)sender;

#pragma mark HUD
-(void)showTopMessage:(NSString *)message;
-(void)showCenterMessage:(NSString *)message;
-(void)showBottomMessag:(NSString *)message;
-(void)showSuccessMessage:(NSString *)message;
-(void)showErorrMessage:(NSString *)message;
-(void)showLoadingMessage:(NSString *)message;

#pragma mark 上一级页面
@property (nonatomic,strong) HSFBaseVC *sourceVC;

#pragma mark 自动约束
@property (nonatomic,assign) BOOL isNotAutoLayout;

#pragma mark 导航标题
@property (nonatomic,strong) NSString *navTitle;


@end
