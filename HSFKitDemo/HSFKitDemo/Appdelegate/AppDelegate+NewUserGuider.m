//
//  AppDelegate+NewUserGuider.m
//  ZMW
//
//  Created by 黄山锋 on 2018/3/22.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "AppDelegate+NewUserGuider.h"

@implementation AppDelegate (NewUserGuider)

#pragma mark /*新手引导页*/
-(void)showNewUserGuiderIfNeeded{
    //当前运行的版本
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    //本地保存的版本号
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [userDe objectForKey:kAPP_Version];
    if ([currentVersion isEqualToString:localVersion]) {
        //已经运行过该版本
        
    } else {
        //第一次运行该版本
        [self newUserGuideShowInView:self.window.rootViewController.view];
    }
}

-(void)newUserGuideShowInView:(UIView *)rootView{
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds];
    [intro setDelegate:self];
    //点击跳过-直接进入
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 0, 230, 40)];
    [btn setTitle:@"进入百货商城>>" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 2.f;
    btn.layer.cornerRadius = 10;
    btn.layer.borderColor = [[UIColor whiteColor] CGColor];
    intro.skipButton = btn;
    //    intro.skipButtonY = 80.f;
    intro.skipButtonAlignment = EAViewAlignmentCenter;
    intro.skipButton.alpha = 0.f;
    intro.skipButton.enabled = NO;
    intro.pageControl.alpha = 1.f;
    
    //    intro.pageControlY = 100.f;
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.bgImage = [UIImage imageNamed:@"guide001"];
    page1.title = @"";
    page1.desc = @"";
    page1.onPageDidAppear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
            intro.pageControl.alpha = 1.f;
        }];
    };
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.bgImage = [UIImage imageNamed:@"guide002"];
    page2.title = @"";
    page2.desc = @"";
    page2.onPageDidAppear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
            intro.pageControl.alpha = 1.f;
        }];
    };
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.bgImage = [UIImage imageNamed:@"guide003"];
    page3.title = @"";
    page3.desc = @"";
    page3.onPageDidAppear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
            intro.pageControl.alpha = 1.f;
        }];
    };
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.bgImage = [UIImage imageNamed:@"guide004"];
    page4.title = @"《百货商城APP》";
    page4.desc = @"互联网快时尚品牌,网上购物首选品牌,提供男装、女装,鞋,家居等多种商品网购,支持货到付款的购物网站,特价商品,优惠券,快速配送,货到付款";
    page4.onPageDidAppear = ^{
        intro.skipButton.enabled = YES;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 1.f;
            intro.pageControl.alpha = 0.f;
        }];
    };
    
    [intro setPages:@[page1,page2,page3,page4]];
    [intro showInView:rootView animateDuration:0.3];
}
#pragma mark EAIntroDelegate
- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped{
    //更新本地存储的版本
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    [userDe setObject:currentVersion forKey:kAPP_Version];
    [userDe synchronize];
    
    
}



@end
