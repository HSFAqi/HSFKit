//
//  HSFBaseVC.m
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFBaseVC.h"



#import "AppDelegate.h"

@interface HSFBaseVC ()<UIViewControllerTransitioningDelegate>

@end

@implementation HSFBaseVC

#pragma mark 返回
-(void)goBack{
    switch (self.curBackType) {
        case BackType_pop:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case BackType_dismiss:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    /* 默认背景色 */
    self.view.backgroundColor = k_backgroundColor_view;
    /* 默认设置-导航栏左边（返回） */
    if (self.isFirstClass) {
        
    }else{        
        //返回
        switch (self.curBackType) {
            case BackType_pop:
            {
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back_com_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
            }
                break;
            case BackType_dismiss:
            {
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"down_com_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
            }
                break;
                
            default:
                break;
        }
    }
    /* 是否限制自动约束 */
    if (self.isNotAutoLayout) {
        if (@available(iOS 11.0, *)) {
            
        } else{
            self.automaticallyAdjustsScrollViewInsets = NO;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    
}

#pragma mark 导航栏左边
-(void)setNavLeftTitles:(NSArray *)titles colors:(NSArray *)colors{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(navLeftItemsACTION:)];
        item.tag = i;
        item.tintColor = colors[i];
        [arr addObject:item];
    }
    self.navigationItem.leftBarButtonItems = arr.mutableCopy;
}
-(void)setNavLeftIcons:(NSArray *)icons{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < icons.count; i++) {
        NSString *iconName = icons[i];
        UIImage *image = [UIImage imageNamed:iconName];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(navLeftItemsACTION:)];
        item.tag = i;
        [arr addObject:item];
    }
    self.navigationItem.leftBarButtonItems = arr.mutableCopy;
}
-(void)setNavLeftViews:(NSArray *)views{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < views.count; i++) {
        UIView *customView = views[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customView];
        item.tag = i;
        [arr addObject:item];
    }
    self.navigationItem.leftBarButtonItems = arr.mutableCopy;
}
//点击导航栏左边的方法
-(void)navLeftItemsACTION:(UIBarButtonItem *)sender{
    
}

#pragma mark 导航栏右边
-(void)setNavRightTitles:(NSArray *)titles colors:(NSArray *)colors{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(navRightItemsACTION:)];
        item.tag = i;
        item.tintColor = colors[i];
        [arr addObject:item];
    }
    self.navigationItem.rightBarButtonItems = arr.mutableCopy;
}
-(void)setNavRightIcons:(NSArray *)icons{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < icons.count; i++) {
        NSString *iconName = icons[i];
        UIImage *image = [UIImage imageNamed:iconName];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(navRightItemsACTION:)];
        item.tag = i;
        [arr addObject:item];
    }
    self.navigationItem.rightBarButtonItems = arr.mutableCopy;
}
-(void)setNavRightViews:(NSArray *)views{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < views.count; i++) {
        UIView *customView = views[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customView];
        item.tag = i;
        [arr addObject:item];
    }
    self.navigationItem.rightBarButtonItems = arr.mutableCopy;
}
//点击导航栏右边的方法
-(void)navRightItemsACTION:(UIBarButtonItem *)sender{
    
}


#pragma mark HUD - 文本提示
-(void)showTopMessage:(NSString *)message{
    [XHToast showTopWithText:message];
}
-(void)showCenterMessage:(NSString *)message{
    [XHToast showCenterWithText:message];
}
-(void)showBottomMessag:(NSString *)message{
    [XHToast showBottomWithText:message];
}

-(void)showSuccessMessage:(NSString *)message{
    [SVProgressHUD showSuccessWithStatus:message];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}
-(void)showErorrMessage:(NSString *)message{
    [SVProgressHUD showErrorWithStatus:message];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}
-(void)showLoadingMessage:(NSString *)message{
    [SVProgressHUD showWithStatus:message];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}
/**
 [SVProgressHUD show];
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 // time-consuming task
 dispatch_async(dispatch_get_main_queue(), ^{
 [SVProgressHUD dismiss];
 });
 });
 */



#pragma mark 代理方法



#pragma mark 回收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark 通知







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
