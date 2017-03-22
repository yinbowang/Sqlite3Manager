//
//  Sqlite3Manager.h
//  数据库demo
//
//  Created by wyb on 2017/3/21.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Myblock) (NSArray * array);

@interface Sqlite3Manager : NSObject

+ (instancetype)shareManager;


/**
 创建manager

 @param name 数据库的名字
 @return manager
 */
- (instancetype)initWithDatabaseNamed:(NSString *)name;


/**
 设置数据库的名字

 @param name 数据库的名字
 */
- (void)setDataBaseName:(NSString *)name;


/**
  创建表

 @param sql sql语句
 @return 如果执行成功返回YES，否返回NO
 */
- (BOOL)createTableWithSql:(NSString *)sql;


/**
 执行数据库表的（增，删，改）操作

 @param sql sql语句
 @param params sql语句对应参数的添加
 @return 如果执行成功返回YES，否返回NO
 */
- (BOOL)execTableWithSql:(NSString *)sql params:(NSArray *)params;


/**
 执行数据库表的（查询）操作异步操作

 @param sql sql语句
 @param params sql语句对应参数的添加
 @param block 返回的数据
 */
- (void) selectTableWithSql:(NSString *)sql params:(NSArray *)params finshBlock:(Myblock)block;

@end
