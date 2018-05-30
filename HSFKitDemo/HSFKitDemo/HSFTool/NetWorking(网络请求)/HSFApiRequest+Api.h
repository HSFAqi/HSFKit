//
//  HSFApiRequest+Api.h
//  HSFKitDemo
//
//  Created by 黄山锋 on 2017/12/13.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFApiRequest.h"

@interface HSFApiRequest (Api)


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
                                      type:(NSString *)type;

/**
 用法示例：
 HSFApiRequest *request = [HSFApiRequest request_sendsms_with_mobile:@"17560744050" type:@"register"];
 
 [HSFNetManager hsf_request_POSTWithUrlString:request.urlString isNeedCache:request.needCache parameters:request.parameters successBlock:^(id response) {
 
 } failureBlock:^(NSError *error) {
 
 } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
 
 }];
 */





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
                                          source_id:(NSString *)source_id;

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
                                          source_id:(NSString *)source_id;




































@end
