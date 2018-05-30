//
//  SSSearchBar.h
//  Demo
//
//  Created by xk jiang on 2017/10/10.
//  Copyright © 2017年 xk jiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SSSearchBarStyle) {
    SSSearchBarStyle_center = 0,                         // no button type
    SSSearchBarStyle_left
};

@interface SSSearchBar : UISearchBar

@property (nonatomic,assign) SSSearchBarStyle style;
@property (nonatomic,assign) CGFloat cornerRadius;
@property (nonatomic,strong) UIColor *borderColor;

@end
