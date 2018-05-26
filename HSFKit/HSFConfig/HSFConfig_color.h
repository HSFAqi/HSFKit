//
//  HSFConfig_color.h
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/26.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#ifndef HSFConfig_color_h
#define HSFConfig_color_h


//颜色
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor  kRGBColor(arc4random_uniform(256)/255.0f,arc4random_uniform(256)/255.0f,arc4random_uniform(256)/255.0f)

#define kColorWithHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]


//>>>>>>>>>>>>>>>>>>>>>>>>
//>>>  基础配置 ： 颜色   >>>
//>>>>>>>>>>>>>>>>>>>>>>>>
/* 默认主题色 */
#define k_themeColor kRGBColor(198, 52, 52)
/* nav */
#define k_navFontColor_nor [UIColor whiteColor]

/* BaseTabBar */
#define k_tabFontColor_nor kRGBColor(138, 138, 138)
#define k_tabFontColor_sel kRGBColor(198, 52, 52)

/* 默认背景色 */
#define k_backgroundColor_view [UIColor groupTableViewBackgroundColor]
#define k_backgroundColor_table [UIColor groupTableViewBackgroundColor]


//文本颜色
#define k_textColor_level001 kRGBColor(33, 33, 33)
#define k_textColor_level002 kRGBColor(76, 76, 76)
#define k_textColor_level003 kRGBColor(94, 94, 94)
#define k_textColor_level004 kRGBColor(121, 121, 121)
#define k_textColor_level005 kRGBColor(192, 192, 192)
//辅助色
#define k_otherColor_001 kRGBColor(252, 169, 188)
#define k_otherColor_002 kRGBColor(51, 146, 255)
#define k_otherColor_003 kRGBColor(255, 172, 47)
#define k_otherColor_004 kRGBColor(77, 147, 225)


#endif /* HSFConfig_color_h */
