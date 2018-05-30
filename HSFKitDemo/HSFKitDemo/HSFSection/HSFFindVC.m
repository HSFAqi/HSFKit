//
//  HSFFindVC.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/29.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFFindVC.h"

@interface HSFFindVC ()

@end

@implementation HSFFindVC

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    self.isFirstClass = YES;
    self.isNotAutoLayout = YES;
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
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
