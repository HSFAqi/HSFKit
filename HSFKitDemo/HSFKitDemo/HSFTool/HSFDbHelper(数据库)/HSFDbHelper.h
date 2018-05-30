//
//  HSFDbHelper.h
//  NovelDemo
//
//  Created by 黄山锋 on 2018/1/27.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSFSingleton.h"

@interface HSFDbHelper : NSObject

/* 单例 */
HSFSingleton_h(HSFDbHelper);


#pragma mark 基础方法
/**
 添加
 */
+(BOOL)HSFDb_add_with_model:(NSObject *)model tableName:(NSString *)tableName;
/**
 删除(条件)
 */
+(BOOL)HSFDb_delete_with_condition:(NSDictionary *)condition modelClass:(Class)modelClass tableName:(NSString *)tableName;
/**
 更新(条件)
 */
+(BOOL)HSFDb_update_with_condition:(NSDictionary *)condition model:(id)model tableName:(NSString *)tableName;
/**
 查询(条件)
 */
+(NSArray *)HSFDb_find_with_condition:(NSDictionary *)condition modelClass:(Class)modelClass tableName:(NSString *)tableName;
/**
 查询全部
 */
+(NSArray *)hsf_findAll_with_modelClass:(Class)modelClass tableName:(NSString *)tableName;


@end
