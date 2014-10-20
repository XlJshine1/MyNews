//
//  UserDB.m
//  sqlist2
//
//  Created by xionglj on 14-8-26.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "UserDB.h"

static UserDB *instance;

@implementation UserDB


/*外界初始化得到单例类对象的唯一接口，这个类方法返回的就是instance，即类的一个对象，
如果instance为空，则实例化一个对象，如果不为空，则直接返回。这样保证了实例的唯一*/
+ (id)shareInstance
{
    if (instance == nil) {
        instance = [[[self class]alloc]init];
    }
    return instance;
}
- (void)createTable
{
        NSString *sql = @"CREATE TABLE IF NOT EXISTS User (title TEXT primary key,time TEXT,image TEXT,url TEXT)";
     [self createTable:sql];
}
//添加用户
- (BOOL)addUser:(UserModel *)usermodel
{
    NSString *sql = @"INSERT INTO User(title,time,image,url) VALUES (?,?,?,?)";
    NSArray *params = [NSArray arrayWithObjects:usermodel.title,
                                                usermodel.time,
                                                usermodel.image,
                                                usermodel.url,
                                                  nil];
    return  [self dealData:sql paramsarray:params];
}
//删除用户
- (BOOL)subUser:(UserModel *)usermodel andTitle:(NSString *)title
{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE title = '%@'",title];
    NSLog(@"sql ===========%@",sql);
  
    return  [self dealData:sql paramsarray:nil];
}
//查询用户
- (NSArray *)findUsers
{
    NSString *sql = @"SELECT * FROM User";
    NSArray *data  = [self selectData:sql columns:4];
    
    //要查找的用户集合
    NSMutableArray *users = [NSMutableArray array];
    
    for (NSArray *row in data) {
        NSString *title =  [row objectAtIndex:0];
        NSString *time =  [row objectAtIndex:1];
        NSString *image =  [row objectAtIndex:2];
        NSString *url = [row objectAtIndex:3];
        
        UserModel *user = [[UserModel alloc]init];
        user.title = title;
        user.time = time;
        user.image = image;
        user.url = url;
        
        [users addObject:user];
        
        
    }
    return users;
}
@end
