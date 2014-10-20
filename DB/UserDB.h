///Users/xionglj/Desktop/任务/sqlist2/sqlist2.xcodeproj
//  UserDB.h
//  sqlist2
//
//  Created by xionglj on 14-8-26.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "BaseDB.h"
#import "UserModel.h"
@interface UserDB : BaseDB
+ (id)shareInstance;
//创建用户表
- (void)createTable;
//添加用户
- (BOOL)addUser:(UserModel *)usermodel;
//删除用户
- (BOOL)subUser:(UserModel *)usermodel andTitle:(NSString *)title;
//查找用户
- (NSArray *)findUsers;
@end
