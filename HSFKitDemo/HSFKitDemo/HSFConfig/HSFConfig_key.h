//
//  HSFConfig_key.h
//  HSFKitDemo
//
//  Created by 黄山锋 on 2018/5/26.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#ifndef HSFConfig_key_h
#define HSFConfig_key_h






//>>>>>>>>>>>>>>>>>>>>
//>>>  第三方平台key >>>
//>>>>>>>>>>>>>>>>>>>>
/* 友盟 */
#define kUMAppKey @"5aa63654f29d9802550001f2"

/* 微信 */
#define kWechatAPPID       @"wxd2409a1a2bcf1f89"
#define kWechatAPPSecret   @"7ca49f7c0e8814b502143c38dbdcc137"
//微信支付商户号
#define kWechatMCHID       @"1489198592"
//安全校验码（MD5）密钥，商户平台登录账户和密码登录http://pay.weixin.qq.com
//平台设置的“API密钥”，为了安全，请设置为以数字和字母组成的32字符串。
#define kWechatPartnerKey  @"huichejianxiaochengxuhuichejianx"
//微信下单接口
#define kWechatPayUrl       @"https://api.mch.weixin.qq.com/pay/unifiedorder"
//微信回调地址
#define kWechatPayNotifyUrl  [NSString stringWithFormat:@"%@/pay/wxpayNotify.php",kRequestHeaderUrl]
//统一下单请求参数键值
#define WXAPPID         @"appid"            // 应用id
#define WXMCHID         @"mch_id"           // 商户号
#define WXNONCESTR      @"nonce_str"        // 随机字符串
#define WXSIGN          @"sign"             // 签名
#define WXBODY          @"body"             // 商品描述
#define WXOUTTRADENO    @"out_trade_no"     // 商户订单号
#define WXTOTALFEE      @"total_fee"        // 总金额
#define WXEQUIPMENTIP   @"spbill_create_ip" // 终端IP
#define WXNOTIFYURL     @"notify_url"       // 通知地址
#define WXTRADETYPE     @"trade_type"       // 交易类型
#define WXPREPAYID      @"prepay_id"        // 预支付交易会话
#define WXATTACH        @"attach"           // 预支付交易会话

/* 微博 */
#define kWeiBoAppKey @""
#define kWeiBoSecret @""

/* QQ */
#define kQQAppKey @""

/* JPush */
#define kJpushAppKey @""
#define kJpushSecret @""

#define JPUSH_channel @"AppStore"
#ifdef DEBUG
#define JPUSH_isProduction 0
#else
#define JPUSH_isProduction 1
#endif

/* 支付宝 */
#define kAliPayAppKey @"2017102509513868"
#define kAliPaySecret @""
//支付宝私钥（用户自主生成，使用pkcs8格式的私钥）
#define kAlipayPrivateKey  @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCeVQK32VaGZOPnDPiF3NhGgk6baGBtNysn/0wwCdwzqmCkKLfjpmPu3LXt3Dxcak+9FldanlGhWwdcQnJT5ii4DoCOoA2h1hkn72s4OLL7RxFIM8hvxvuMwkK8W+vbyehHDErocoWsEe9IFEPwIl/4e3cSzf3AzYgvVUWv16Yg4Caw2aoIhOvL09DC+8oLKVj+6fPpr6ExOs6ZF/mUVXxTN1JDwlEkQUR4FmI6y2p9EewRZz1icbirJlX8KqQmEEEKBExe/H9lqPepTK96yQ8LIacqICmkrSs3BbhnUCyTpdFkbqx71UPRkyCbspnR/5RoxxaDcME1czId13k+yxUdAgMBAAECggEARhzE+F7AxwCUPzNqNfTmvMplPsJIuPROIwcVWMx0+1f+NZNmYuPCqvqHgY4eGJpnNwdWpWUoJrilmMA/2lE4RND/MqlDgB/LwfhuVVYeQ9FjoMJ1hrHpoJpBbSGTXx+YwSV7YlWcRecnO5blwsemEeWyg9w9+wvIu5UaJ9Tp1vJW8cDoy4Ha/Od4Czejrj/7CjUBIa/fagdERYNRCDzXnSjtsxKXdHhooLFrWzycLqHxSzJcjT5x0g4uz9bem2NW0RvCTZJ8fXmfDPtzVb1IzypzQGqhUGi2Pzt4QjGpWT1wsCctyp1mJqezhdnjjhikfb92P9BsQpmoCDH4HLG57QKBgQDsdLSy/TZPG50N6XuEP6iYQJoEYmn9UL/PTTCa/8xoIBjHSmLd2nHNWMojO1nzrpAhE3hh3NtrYNRcd6518Bac5Es6Ysz40qr+SxNbe7o0NXt7dumeSjM5TSHx8FgvivMPv+hBKUTDEEx0vugKG4hsy2FcHaxjdrBfPBFzwOgi5wKBgQCraz334OXY3mFJ4OMftvzh20WYHzMSFLsx/m5LL7OSadLXMHMpO9tCJmqHYPh+y+mXtovOdgtQhfXWo2f8Hy6BPOil7mro0POB7HhckaAnG4T/0xgLA3I4e9SE4c/P2AZWgQVbVN14UAfjqRYqDrF+M0UbezAUyOo7Nig3YOtLWwKBgHLNWupILDUOWBtoD9MuwSFixCR6z7Dwop/4fy/SICEx7DXeNNA3/ebQRBwE9fBtAYc9l8YT3+hrc8+NQAP81E3KPYgUbiYkymZ6duSE1uwAR3qzSkvTBLm+bEu2AGrc0JQF/bKdYcg/Qo+wHKLDqWIBAL0jnw4PkyQ52tNThqFjAoGBAIsXt+69BIRW3eaOnn0LhGLYA76OAmi3fbXxWBmWGUXCrJyD6c4Zja49cc9r9fcdCuxZ6VOcIU4zhOmnKidAPgIMJFMQBJvpgM15zah/Wc6h2+ehqC63myUOBcHVYUSra2khw/D6CcMoXV5zw1JZHdjjTT4hVUBoTvfA2B0nfYVlAoGBALhn/W6ST4aeIDM87BA/1KBRJwpBtg1C4m4Wg7zwNQpxjkRHOvLmU2xCj2DlLekPcGwQkg+NFD4eReK5bsjBX8MmXOYwHjkzU46pFfkxerAJEqlZTfo3yFtMYS8tbUBtXO/yTAILptFICVqW0xSItPaitz9ZEBXqfuy6JmbmoOZ6"
//支付宝公钥
#define kAlipayPublicKey  @"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnlUCt9lWhmTj5wz4hdzYRoJOm2hgbTcrJ/9MMAncM6pgpCi346Zj7ty17dw8XGpPvRZXWp5RoVsHXEJyU+YouA6AjqANodYZJ+9rODiy+0cRSDPIb8b7jMJCvFvr28noRwxK6HKFrBHvSBRD8CJf+Ht3Es39wM2IL1VFr9emIOAmsNmqCITry9PQwvvKCylY/unz6a+hMTrOmRf5lFV8UzdSQ8JRJEFEeBZiOstqfRHsEWc9YnG4qyZV/CqkJhBBCgRMXvx/Zaj3qUyveskPCyGnKiAppK0rNwW4Z1Ask6XRZG6se9VD0ZMgm7KZ0f+UaMcWg3DBNXMyHdd5PssVHQIDAQAB"
//支付宝回调地址
#define kAlipayNotify_url  [NSString stringWithFormat:@"%@/pay/alipayNotify.php",kRequestHeaderUrl]


/* 百度地图 */
#define kBaiDuMapKey @""

/* 高德地图 */
#define kGaoDeMapKey @""

/* 环信 */
#define kEMKey @"1171171103178970#huichejian"//环信key
//环信推送证书
#ifdef DEBUG
#define kApnsCertName @"huichejian_test_development"
#else
#define kApnsCertName @"huichejian_test_distribute"
#endif
//默认所有用户的环信登录密码都是123456
#define kEMPassword @"123456"

/* LeanCloud */
#define kLeanCloudID @"IcAA5yWbBEVOwYQiTFMhp6Yl-gzGzoHsz"
#define kLeanCloudKey @"XGxAz3RutwldaTbNqmyejxs8"
#define kLeanCloudMasterKey @"MtwTkfM5IEnV54mkqYiunIzG"

/* Bugly */
#define kBuglyID @"e70cad4337"
#define kBuglyKey @"5f6aba3e-13be-492d-a3b7-3cb040b192bb"




#endif /* HSFConfig_key_h */
