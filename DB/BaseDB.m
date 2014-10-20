//
//  BaseDB.m
//  sqlist2
//
//  Created by xionglj on 14-8-25.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "BaseDB.h"

#define kFilename @"data.sqlite"
@implementation BaseDB

//选择路径
-(NSString *)filePath
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",kFilename];
    return filePath;
}

//创建表
- (void)createTable:(NSString *)sql
{
    sqlite3 *sqlite = nil;
    //打开数据库
    
    
    if(sqlite3_open([self.filePath UTF8String], &sqlite)!= SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
    
        sqlite3_close(sqlite);
        return;
    }
    char *errmag = nil;
        NSLog(@"filepath%@",self.filePath);
    if (sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &errmag) != SQLITE_OK) {
        NSLog(@"创建表失败：%s",errmag);
        sqlite3_close(sqlite);
    }
    sqlite3_close(sqlite);
}

/*接口描述:插入数据，删除数据，修改数据
*参数；sql：sql语句
*返回值；是否执行成功
*/
- (BOOL)dealData:(NSString *)sql paramsarray:(NSArray *)params
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    //打开数据库
    if(sqlite3_open([self.filePath UTF8String], &sqlite)!= SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return NO;
    }
    //编译sql语句
    if (sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK) {
        NSLog(@"SQL语句编译失败");
        sqlite3_close(sqlite);
        return NO;
    }
    //绑定数据
    for (int i = 0; i <params.count; i++) {
        NSString *value = [params objectAtIndex:i];
        sqlite3_bind_text(stmt, i+1, [value UTF8String], -1, NULL);
    }
    //执行SQl语句
    if (sqlite3_step(stmt)==SQLITE_ERROR) {
        NSLog(@"Sql语句执行失败");
        sqlite3_close(sqlite);
        return NO;
    }
    //关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return YES;
    
}

/*接口描述；查询数据
 *参数； sql：sql语句
 *返回值
 *     ［“字段值1”，“字段值2”，“字段值3”］，
 *     ［“字段值1”，“字段值2”，“字段值3”］，
 *     ［“字段值1”，“字段值2”，“字段值3”］，
 */
- (NSMutableArray *)selectData:(NSString *)sql columns:(int)number
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    //打开数据库
    if(sqlite3_open([self.filePath UTF8String], &sqlite)!= SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        //return;
    }
    //编译sql语句
    if (sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK) {
        NSLog(@"SQL语句编译失败");
        sqlite3_close(sqlite);
        //return;
    }
    
    //查询数据
    int result = sqlite3_step(stmt);
    NSMutableArray *data = [NSMutableArray array];
    
     NSLog(@"result=%d",result);
    
     while (result == SQLITE_ROW) {
        NSLog(@"aaresult=%d",result);
        NSMutableArray *row = [NSMutableArray arrayWithCapacity:3];
      for (int i = 0; i<number; i++) {
          char *columnText = (char *)sqlite3_column_text(stmt, i);
          
          //将columntext转成字符串
          NSString *string = [NSString stringWithCString:columnText encoding:NSUTF8StringEncoding];
          [row addObject:string];
        }
        [data addObject:row];
        result = sqlite3_step(stmt);
    }
    
    
    //关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    
    return data;
}
@end
