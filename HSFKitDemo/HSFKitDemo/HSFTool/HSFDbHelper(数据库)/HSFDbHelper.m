//
//  HSFDbHelper.m
//  NovelDemo
//
//  Created by 黄山锋 on 2018/1/27.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFDbHelper.h"


@implementation HSFDbHelper

/* 单例 */
HSFSingleton_m(HSFDbHelper);


#pragma mark 基础方法
/**
 添加
 */
+(BOOL)HSFDb_add_with_model:(NSObject *)model tableName:(NSString *)tableName{
    model.bg_tableName = tableName;
    //保存到数据库
    BOOL isSuccess = [model bg_save];
    return isSuccess;
}
/**
 删除(条件)
 */
+(BOOL)HSFDb_delete_with_condition:(NSDictionary *)condition modelClass:(Class)modelClass tableName:(NSString *)tableName{
    __block NSMutableArray *arr = [NSMutableArray array];
    [condition enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *str = [NSString stringWithFormat:@"%@=%@",bg_sqlKey(key),bg_sqlValue(obj)];
        [arr addObject:str];
    }];
    NSString *contitionStr = [arr componentsJoinedByString:@"and"];
    NSString* where = [NSString stringWithFormat:@"where %@",contitionStr];
    BOOL isSuccess = [modelClass bg_delete:tableName where:where];
    return isSuccess;
}

/**
 更新(条件)
 */
+(BOOL)HSFDb_update_with_condition:(NSDictionary *)condition model:(id)model tableName:(NSString *)tableName{
    __block NSMutableArray *arr = [NSMutableArray array];
    [condition enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *str = [NSString stringWithFormat:@"%@=%@",bg_sqlKey(key),bg_sqlValue(obj)];
        [arr addObject:str];
    }];
    NSString *contitionStr = [arr componentsJoinedByString:@"and"];
    NSString* where = [NSString stringWithFormat:@"where %@",contitionStr];
    BOOL isSuccess = [model bg_updateWhere:where];
    
    return isSuccess;
}


/**
 查询(条件)
 */
+(NSArray *)HSFDb_find_with_condition:(NSDictionary *)condition modelClass:(Class)modelClass tableName:(NSString *)tableName{
    __block NSMutableArray *arr = [NSMutableArray array];
    [condition enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *str = [NSString stringWithFormat:@"%@=%@",bg_sqlKey(key),bg_sqlValue(obj)];
        [arr addObject:str];
    }];
    NSString *contitionStr = [arr componentsJoinedByString:@"and"];
    NSString* where = [NSString stringWithFormat:@"where %@",contitionStr];
    NSArray *result = [modelClass bg_find:tableName where:where];
    return result;
}
/**
 查询全部
 */
+(NSArray *)hsf_findAll_with_modelClass:(Class)modelClass tableName:(NSString *)tableName{
    NSArray* arr = [modelClass bg_findAll:tableName];
    return arr;
}


@end
