//
//  HSFApiRequest+Api.m
//  HSFKitDemo
//
//  Created by 黄山锋 on 2017/12/13.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFApiRequest+Api.h"

@implementation HSFApiRequest (Api)



/**
 1.1发送验证码 （/api/public/sendsms）
 
 参数说明
 参数      说明
 mobile      手机号码
 type        短信类型
 
 短信类型取值
 register        注册
 forgotten       忘记密码
 modifypassword  修改密码
 login           短信登录
 
 */
+(instancetype)request_sendsms_with_mobile:(NSString *)mobile
                                     type:(NSString *)type{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (mobile) {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    if (type) {
        [parameters setObject:type forKey:@"type"];
    }
    return [HSFApiRequest initWithUrlString:@"/api/public/sendsms" parameters:parameters needCache:NO];
}


/**
 ==========
 小说项目接口
 ==========
 */

/**
 获取章节目录 （/api/novel/getChapterList)
 
 参数说明
 
 novel_id        小说id
 source_id       源id
 */
+(instancetype)request_getChapterList_with_novel_id:(NSString *)novel_id
                                          source_id:(NSString *)source_id{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (novel_id) {
        [parameters setObject:novel_id forKey:@"novel_id"];
    }
    if (source_id) {
        [parameters setObject:source_id forKey:@"source_id"];
    }
    return [HSFApiRequest initWithUrlString:@"/api/novel/getChapterList" parameters:parameters needCache:NO];
}

/**
 获取章节内容 （/api/novel/getChapterContent)
 
 参数说明
 
 token           登录token信息
 novel_id
 id              章节id
 source_id       源id
 */
+(instancetype)request_getChapterContent_with_token:(NSString *)token
                                        novel_id:(NSString *)novel_id
                                        chapter_id:(NSString *)chapter_id
                                        source_id:(NSString *)source_id{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (token) {
        [parameters setObject:token forKey:@"token"];
    }
    if (novel_id) {
        [parameters setObject:novel_id forKey:@"novel_id"];
    }
    if (chapter_id) {
        [parameters setObject:chapter_id forKey:@"id"];
    }
    if (source_id) {
        [parameters setObject:source_id forKey:@"source_id"];
    }
    return [HSFApiRequest initWithUrlString:@"/api/novel/getChapterContent" parameters:parameters needCache:NO];
}













@end
