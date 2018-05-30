//
//  ExpireTimeView.h
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/10/27.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpireTimeView : UIView
@property (nonatomic,strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;



@property (nonatomic,strong) NSDate *expireTime;
-(void)startTimeCountDown;

@end
