//
//  HSFApiRequest.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2017/12/13.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFApiRequest.h"


@implementation HSFApiRequest



//初始化方法-类方法
+(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters needCache:(BOOL)needCache{
    return [[self alloc] initWithUrlString:urlString parameters:parameters needCache:needCache];
}
//初始化方法-对象方法
-(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters needCache:(BOOL)needCache{
    if (self = [super init]) {
        self.urlString = urlString;
        self.parameters = parameters;
        self.needCache = needCache;
    }
    return self;
}

//setter
-(void)setUrlString:(NSString *)urlString{
    _urlString = urlString;
}
-(void)setParameters:(NSDictionary *)parameters{
    NSMutableDictionary *muparameters =(parameters)?parameters.mutableCopy:@{}.mutableCopy;
    NSArray *allKey = [muparameters allKeys];
    NSArray *values = [muparameters allValues];
    __block NSString *urlStr = @"";
    [allKey enumerateObjectsUsingBlock:^(NSString  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *value = (idx < values.count)?value = values[idx]:@"";
        urlStr = [urlStr stringByAppendingFormat:@"&%@=%@",obj,value];
    }];
    
#ifdef DEBUG
    NSLog(@"\n\n\n\n*************\n*****************\n%@%@%@?%@\n***************\n***************\n\n\n\n",kBaseUrl,@"",_urlString,urlStr);
#else
    
#endif
    _parameters = muparameters.copy;
    _urlString = [NSString stringWithFormat:@"%@%@",kBaseUrl,_urlString];
}






@end
