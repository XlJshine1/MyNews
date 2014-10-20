//
//  detailNewsEntity.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "detailNewsEntity.h"

@implementation detailNewsEntity
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

//异步请求代理方法－－返回数据，加入到(NSData*) _Data 中
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求数据失败");
}
- (NSData *)getImage:(NSString *)url
{   
    
    if (url == nil) {
        return nil;
    }
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:30];
    
    [request startSynchronous];
    if(request.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    
    return request.responseData;
}

//请求数据完成时调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成.....");
    NSError *error;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data options:NSJSONReadingAllowFragments error:&error ];
    
    //对新闻主页进行解析
    NSLog(@"error=%@",error);
    
    NSDictionary *dic2 = [dic objectForKey:@"body"];
    detailNewsModel *model = [[detailNewsModel alloc]init];
    model.text = [dic2 objectForKey:@"text"];
    model.title = [dic2 objectForKey:@"title"];
    model.thumbnail =  [UIImage imageWithData:[self getImage:[dic2 objectForKey:@"thumbnail"]]];
    
    _Array = [[NSMutableArray alloc]init];
  
    [_Array addObject:model];

    //（数据解析完成后）发送通知
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"todetailview" object:_Array userInfo:nil];
    
    
    
    
    
    
}
@end
