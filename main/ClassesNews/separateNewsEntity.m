//
//  separateNewsEntity.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "separateNewsEntity.h"
#import "separateNewsModel.h"
@implementation separateNewsEntity
@synthesize Array = _Array;
@synthesize Data = _Data;
//请求接口数据，异步方法
- (void)getNews:(NSURL *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if (connection) 
    {
        
        _Data = [[NSMutableData alloc]init];
        
    }
    
}



//异步请求代理方法－－返回数据，加入到(NSData*) _Data1 中
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求数据失败");
}

//请求数据完成时调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成.....");
    NSError *error;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data options:NSJSONReadingAllowFragments error:&error ];
    
    //对新闻主页进行解析
    NSLog(@"error=%@",error);
    NSLog(@"data%@",dic);
    
    NSDictionary *dic2 = [dic objectForKey:@"body"];
    
    NSArray *array = [dic2 objectForKey:@"item"];
    
    
    //遍历字典
    _Array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic3 in array) 
    {   
        separateNewsModel *model = [[separateNewsModel alloc]init];
        model.ID = [dic3 objectForKey:@"id"];

        
        [_Array addObject:model.ID];
    }
 

     //（数据解析完成后）发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"separate" object:_Array userInfo:nil];
    
    
    
    
    
    
}
@end
