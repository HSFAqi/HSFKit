//
//  HSFNetManager.m
//  HSFChatKit
//
//  Created by JuZhenBaoiMac on 2017/9/1.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFNetManager.h"


#import <BANetManager/BANetManager.h>//网络请求框架
#import <BANetManager/BANetManagerCache.h>//网络请求框架(缓存)
#import "HSFSingleton.h"

@implementation HSFNetManager
//单例的创建
HSFSingleton_m(NetManager);


//设置网络请求的相关属性
+(void)initialize{
    BANetManagerShare.requestSerializer = BAHttpRequestSerializerHTTP;
    BANetManagerShare.responseSerializer = BAHttpResponseSerializerJSON;
    BANetManagerShare.timeoutInterval = 30;
    
}



/**
 网络请求的实例方法 get
 
 @param urlString 请求的地址
 @param isNeedCache 是否需要缓存，只有 get / post 请求有缓存配置
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progressBlock 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_request_GETWithUrlString:(NSString *)urlString
                                      isNeedCache:(BOOL)isNeedCache
                                       parameters:(NSDictionary *)parameters
                                     successBlock:(BAResponseSuccessBlock)successBlock
                                     failureBlock:(BAResponseFailBlock)failureBlock
                                    progressBlock:(BADownloadProgressBlock)progressBlock{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BADataEntity *entity = [[BADataEntity alloc]init];
    entity.urlString = urlString;
    entity.needCache = isNeedCache;
    entity.parameters = parameters;
    
    sessionTask = [BANetManager ba_request_GETWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
    return sessionTask;
}
/**
 网络请求的实例方法 post
 
 @param urlString 请求的地址
 @param isNeedCache 是否需要缓存，只有 get / post 请求有缓存配置
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progressBlock 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_request_POSTWithUrlString:(NSString *)urlString
                                       isNeedCache:(BOOL)isNeedCache
                                        parameters:(NSDictionary *)parameters
                                      successBlock:(BAResponseSuccessBlock)successBlock
                                      failureBlock:(BAResponseFailBlock)failureBlock
                                      progressBlock:(BADownloadProgressBlock)progressBlock{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BADataEntity *entity = [[BADataEntity alloc]init];
    entity.urlString = urlString;
    entity.needCache = isNeedCache;
    entity.parameters = parameters;
    
    sessionTask = [BANetManager ba_request_POSTWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
    return sessionTask;
}

/**
 网络请求的实例方法 put
 
 @param urlString 请求的地址
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progressBlock 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_request_PUTWithUrlString:(NSString *)urlString
                                       parameters:(NSDictionary *)parameters
                                     successBlock:(BAResponseSuccessBlock)successBlock
                                     failureBlock:(BAResponseFailBlock)failureBlock
                                     progressBlock:(BADownloadProgressBlock)progressBlock{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BADataEntity *entity = [[BADataEntity alloc]init];
    entity.urlString = urlString;
    entity.parameters = parameters;
    
    sessionTask = [BANetManager ba_request_PUTWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
    return sessionTask;
}

/**
 网络请求的实例方法 delete
 
 @param urlString 请求的地址
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progressBlock 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_request_DELETEWithUrlString:(NSString *)urlString
                                          parameters:(NSDictionary *)parameters
                                        successBlock:(BAResponseSuccessBlock)successBlock
                                        failureBlock:(BAResponseFailBlock)failureBlock
                                       progressBlock:(BADownloadProgressBlock)progressBlock{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BADataEntity *entity = [[BADataEntity alloc]init];
    entity.urlString = urlString;
    entity.parameters = parameters;
    
    sessionTask = [BANetManager ba_request_DELETEWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
    return sessionTask;
}

/**
 上传图片(多图)
 
 @param urlString 上传的url
 @param parameters 上传图片预留参数---视具体情况而定 可移除
 @param imageArray 上传的图片数组
 @param fileName 上传的图片数组fileName
 @param successBlock 上传成功的回调
 @param failureBlock 上传失败的回调
 @param progress 上传进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_uploadImageWithUrlString:(NSString *)urlString
                                       parameters:(NSDictionary *)parameters
                                       imageArray:(NSArray *)imageArray
                                         fileName:(NSString *)fileName
                                     successBlock:(BAResponseSuccessBlock)successBlock
                                      failurBlock:(BAResponseFailBlock)failureBlock
                                   upLoadProgress:(BAUploadProgressBlock)progress{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BAImageDataEntity *entity = [[BAImageDataEntity alloc]init];
    entity.urlString = urlString;
    entity.parameters = parameters;
    entity.imageArray = imageArray;
    NSMutableArray *fileNameArr = [NSMutableArray array];
    for (int i = 0; i < imageArray.count; i++) {
        [fileNameArr addObject:fileName];
    }
    entity.fileNames = fileNameArr;
    entity.imageType = @"image/png";
    entity.imageScale = 1.0;
    
    sessionTask = [BANetManager ba_uploadImageWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failurBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];

    return sessionTask;
}

/**
 视频上传
 
 @param urlString 上传的url
 @param parameters 上传视频预留参数---视具体情况而定 可移除
 @param videoPath 上传视频的本地沙河路径
 @param successBlock 成功的回调
 @param failureBlock 失败的回调
 @param progress 上传的进度
 */
+ (void)hsf_uploadVideoWithUrlString:(NSString *)urlString
                         parameters:(NSDictionary *)parameters
                          videoPath:(NSString *)videoPath
                       successBlock:(BAResponseSuccessBlock)successBlock
                       failureBlock:(BAResponseFailBlock)failureBlock
                     uploadProgress:(BAUploadProgressBlock)progress{
    [self startIndicator];
    
    BAFileDataEntity *entity = [[BAFileDataEntity alloc]init];
    entity.urlString = urlString;
    entity.parameters = parameters;
    entity.filePath = videoPath;
    
    [BANetManager ba_uploadVideoWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

/**
 文件下载
 
 @param urlString 请求的url
 @param parameters 文件下载预留参数---视具体情况而定 可移除
 @param savePath 下载文件保存路径
 @param successBlock 下载文件成功的回调
 @param failureBlock 下载文件失败的回调
 @param progress 下载文件的进度显示
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)hsf_downLoadFileWithUrlString:(NSString *)urlString
                                        parameters:(NSDictionary *)parameters
                                          savaPath:(NSString *)savePath
                                      successBlock:(BAResponseSuccessBlock)successBlock
                                      failureBlock:(BAResponseFailBlock)failureBlock
                                  downLoadProgress:(BADownloadProgressBlock)progress{
    [self startIndicator];
    BAURLSessionTask *sessionTask = nil;
    
    BAFileDataEntity *entity = [[BAFileDataEntity alloc]init];
    entity.urlString = urlString;
    entity.parameters = parameters;
    entity.filePath = savePath;
    
    sessionTask = [BANetManager ba_downLoadFileWithEntity:entity successBlock:^(id response) {
        if (response) {
            successBlock(response);
        }
        [self stopIndicator];
    } failureBlock:^(NSError *error) {
        if (error) {
            failureBlock(error);
        }
        [self showError:error.localizedDescription];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    
    return sessionTask;
}



#pragma mark - 网络状态监测
/*!
 *  开启实时网络状态监测，通过Block回调实时获取(此方法可多次调用)
 */
+ (void)hsf_startNetWorkMonitoringWithBlock:(BANetworkStatusBlock)networkStatus{
    [BANetManager ba_startNetWorkMonitoringWithBlock:networkStatus];
}

#pragma mark - 自定义请求头
/**
 *  自定义请求头
 */
+ (void)hsf_setValue:(NSString *)value forHTTPHeaderKey:(NSString *)HTTPHeaderKey{
    [BANetManager ba_setValue:value forHTTPHeaderKey:HTTPHeaderKey];
}

#pragma mark - 取消 Http 请求
/*!
 *  取消所有 Http 请求
 */
+ (void)hsf_cancelAllRequest{
    [BANetManager ba_cancelAllRequest];
}

/*!
 *  取消指定 URL 的 Http 请求
 */
+ (void)hsf_cancelRequestWithURL:(NSString *)URL{
    [BANetManager ba_cancelRequestWithURL:URL];
}


#pragma mark -指示器HUD
//加载中
+ (void)startIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD show];
}
//停止加载
+ (void)stopIndicator{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
}
//加载失败
+ (void)showError:(NSString *)errorString {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD showErrorWithStatus:errorString];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}


@end
