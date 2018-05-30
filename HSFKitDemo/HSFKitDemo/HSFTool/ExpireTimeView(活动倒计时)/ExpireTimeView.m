//
//  ExpireTimeView.m
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/10/27.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "ExpireTimeView.h"

@interface ExpireTimeView ()

@property (nonatomic,assign) NSTimeInterval timeInterval;

@end

@implementation ExpireTimeView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    self.hourLabel.layer.masksToBounds = YES;
    self.hourLabel.layer.cornerRadius = 3;
    
    self.minuteLabel.layer.masksToBounds = YES;
    self.minuteLabel.layer.cornerRadius = 3;
    
    self.secondLabel.layer.masksToBounds = YES;
    self.secondLabel.layer.cornerRadius = 3;
}

-(void)startTimeCountDown{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate_tomorrow = self.expireTime;
    NSDate *startDate = [NSDate date];
    self.timeInterval =[endDate_tomorrow timeIntervalSinceDate:startDate];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerLoopACTION) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer setFireDate:[NSDate distantPast]];
}



#pragma mark -懒加载
//带天数
-(void)timerLoopACTION{
    if (self.timeInterval!=0) {
        if(self.timeInterval<=0){ //倒计时结束，关闭
            [self.timer setFireDate:[NSDate distantFuture]];
            self.timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.dayLabel.text = @"";
                self.hourLabel.text = @"00";
                self.minuteLabel.text = @"00";
                self.secondLabel.text = @"00";
            });
        }else{
            int days = (int)(self.timeInterval/(3600*24));
            if (days==0) {
                self.dayLabel.text = @"";
            }
            int hours = (int)((self.timeInterval-days*24*3600)/3600);
            int minute = (int)(self.timeInterval-days*24*3600-hours*3600)/60;
            int second = self.timeInterval-days*24*3600-hours*3600-minute*60;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (days==0) {
                    self.dayLabel.text = @"0天";
                }else{
                    self.dayLabel.text = [NSString stringWithFormat:@"%d天",days];
                }
                if (hours<10) {
                    self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
                }else{
                    self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
                }
                if (minute<10) {
                    self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
                }else{
                    self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
                }
                if (second<10) {
                    self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
                }else{
                    self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
                }
            });
            self.timeInterval--;
        }
    }
}
//不带天数
//-(void)timerLoopACTION{
//    if (self.timeInterval!=0) {
//        if(self.timeInterval<=0){ //倒计时结束，关闭
//            [self.timer setFireDate:[NSDate distantFuture]];
//            self.timer = nil;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.dayLabel.text = @"";
//                self.hourLabel.text = @"00";
//                self.minuteLabel.text = @"00";
//                self.secondLabel.text = @"00";
//            });
//        }else{
//            int days = (int)(self.timeInterval/(3600*24));
//            if (days==0) {
//                self.dayLabel.text = @"";
//            }
//            int hours = (int)((self.timeInterval)/3600);
//            int minute = (int)(self.timeInterval-hours*3600)/60;
//            int second = self.timeInterval-hours*3600-minute*60;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (days==0) {
//                    self.dayLabel.text = @"";
//                }else{
//                    self.dayLabel.text = @"";
//                }
//                if (hours<10) {
//                    self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
//                }else{
//                    self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
//                }
//                if (minute<10) {
//                    self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
//                }else{
//                    self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
//                }
//                if (second<10) {
//                    self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
//                }else{
//                    self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
//                }
//            });
//            self.timeInterval--;
//        }
//    }
//}

@end
