//
//  HSFGestureTableView.m
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/29.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFGestureTableView.h"

@implementation HSFGestureTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


@end
