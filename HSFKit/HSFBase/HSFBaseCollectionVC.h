//
//  HSFBaseCollectionVC.h
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/26.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFBaseVC.h"

@interface HSFBaseCollectionVC : HSFBaseVC

@property (nonatomic,strong) UICollectionView *collectionView;
/* 是否支持多手势 */
@property (nonatomic,assign) BOOL isMulGesture;//默认：NO

@end
