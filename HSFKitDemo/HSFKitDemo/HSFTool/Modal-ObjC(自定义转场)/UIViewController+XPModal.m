//
//  UIViewController+XPModal.m
//  https://github.com/xiaopin/iOS-Modal.git
//
//  Created by xiaopin on 2018/4/23.
//  Copyright © 2018年 xiaopin. All rights reserved.
//

#import "UIViewController+XPModal.h"
#import "XPModalTransitioningDelegate.h"
#import <objc/message.h>
#import "XPModalPresentationController.h"

#pragma mark -
@implementation UIViewController (XPModal)

/**
 显示一个模态视图控制器
 
 @param viewController  模态视图控制器
 @param contentSize     模态窗口大小(内部会限制宽高最大值为屏幕的宽高)
 @param configuration   模态窗口的配置信息
 @param completion      模态窗口显示完毕时的回调
 */
- (void)presentModalWithViewController:(UIViewController *)viewController contentSize:(CGSize)contentSize configuration:(XPModalConfiguration *)configuration completion:(ModalCompletionHandler)completion {
    if (self.presentedViewController) { return; }
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.preferredContentSize = contentSize;
    
    XPModalTransitioningDelegate *transitioningDelegate = [XPModalTransitioningDelegate transitioningDelegateWithConfiguration:configuration];
    viewController.transitioningDelegate = transitioningDelegate;
    objc_setAssociatedObject(viewController, _cmd, transitioningDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
//    static char delegateKey;
//    objc_setAssociatedObject(viewController, &delegateKey, transitioningDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    
//    XPModalPresentationController *presentationController = (XPModalPresentationController *)viewController.presentationController;
//    presentationController.configuration = configuration;
//    
//    if (configuration.enableShadow) {
//        // Add shadow effect.
//        viewController.view.layer.shadowColor = [[UIColor blackColor] CGColor];
//        viewController.view.layer.shadowOffset = CGSizeMake(0.0, -3.0);
//        viewController.view.layer.shadowRadius = configuration.shadowRadius;
//        viewController.view.layer.shadowOpacity = configuration.shadowOpacity;
//        viewController.view.layer.shouldRasterize = YES;
//        viewController.view.layer.rasterizationScale = [[UIScreen mainScreen] scale];
//    }
    
    
    [self presentViewController:viewController animated:true completion:completion];
}

/**
 显示一个模态视图
 
 @param view            模态视图控制器
 @param contentSize     模态窗口大小(内部会限制宽高最大值为屏幕的宽高)
 @param configuration   模态窗口的配置信息
 @param completion      模态窗口显示完毕时的回调
 */
- (void)presentModalWithView:(UIView *)view contentSize:(CGSize)contentSize configuration:(XPModalConfiguration *)configuration completion:(ModalCompletionHandler)completion {
    UIViewController *modalVC = [[UIViewController alloc] init];
    modalVC.view.backgroundColor = [UIColor clearColor];
    [modalVC.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"view": view};
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    
    [self presentModalWithViewController:modalVC contentSize:contentSize configuration:configuration completion:completion];
}

@end
