//
//  HSFApiRequest.h
//  HSFKitDemo
//
//  Created by 黄山锋 on 2017/12/13.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HSFApiRequest : NSObject

/** 请求路径 */
@property (nonatomic, copy) NSString *urlString;
/** 请求参数 */
@property (nonatomic, copy) id parameters;
/** 是否缓存响应 */
@property (nonatomic, assign, getter=isNeedCache) BOOL needCache;


//初始化方法-类方法
+(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters needCache:(BOOL)needCache;
//初始化方法-对象方法
-(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters needCache:(BOOL)needCache;

@end
