//
//  NSString+DisplayTime.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "NSString+DisplayTime.h"

@implementation NSString (DisplayTime)


//通过时间戳计算时间差（几小时前、几天前）
+(NSString *) compareCurrentTime:(NSTimeInterval) compareDate
{
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:compareDate];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *referenceComponents = [calendar components:unitFlags fromDate:confromTimesp];
    //    NSInteger referenceYear  =referenceComponents.year;
    //    NSInteger referenceMonth =referenceComponents.month;
    //    NSInteger referenceDay   =referenceComponents.day;
    NSInteger referenceHour  =referenceComponents.hour;
    //    NSInteger referemceMinute=referenceComponents.minute;
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if ((temp = timeInterval/3600/24)==1)
    {
        result = [NSString stringWithFormat:@"昨天%ld时",referenceHour];
    }
    else if ((temp = timeInterval/3600/24)==2)
    {
        result = [NSString stringWithFormat:@"前天%ld时",referenceHour];
    }
    
    else if((temp = timeInterval/3600/24) <31){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = timeInterval/3600/24/30) <12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

//通过时间戳得出显示时间
+ (NSString*) getDateStringWithTimestamp:(NSTimeInterval)timestamp
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceYear  =referenceComponents.year;
    NSInteger referenceMonth =referenceComponents.month;
    NSInteger referenceDay   =referenceComponents.day;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",referenceYear,referenceMonth,referenceDay];
}



//通过时间戳和格式显示时间
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter
{
    if ([NSString stringWithFormat:@"%@", @(timestamp)].length == 13) {
        timestamp /= 1000.0f;
    }
    NSDate*timestampDate=[NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:timestampDate];
    
    return strDate;
}

//通过出生日期计算年龄
+(NSString *)getAgeWithBirthday:(NSDate *)birthday_date
{
    NSTimeInterval  timeInterval = [birthday_date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *referenceComponents = [calendar components:unitFlags fromDate:birthday_date];
    //    NSInteger referenceYear  =referenceComponents.year;
    //    NSInteger referenceMonth =referenceComponents.month;
    //    NSInteger referenceDay   =referenceComponents.day;
    NSInteger referenceHour  =referenceComponents.hour;
    //    NSInteger referemceMinute=referenceComponents.minute;
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚出生"];
    }
    else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"出生%ld分钟",temp];
    }
    
    else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"出生%ld小时",temp];
    }
    else if ((temp = timeInterval/3600/24)==1)
    {
        result = [NSString stringWithFormat:@"昨天%ld时出生",(long)referenceHour];
    }
    else if ((temp = timeInterval/3600/24)==2)
    {
        result = [NSString stringWithFormat:@"前天%ld时出生",(long)referenceHour];
    }
    
    else if((temp = timeInterval/3600/24) <31){
        result = [NSString stringWithFormat:@"%ld天前出生",temp];
    }
    
    else if((temp = timeInterval/3600/24/30) <12){
        result = [NSString stringWithFormat:@"%ld个月前出生",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld岁",temp];
    }
    
    return  result;
}





@end
