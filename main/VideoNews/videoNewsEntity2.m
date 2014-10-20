//
//  videoNewsEntity2.m
//  News
//
//  Created by xionglj on 14-9-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "videoNewsEntity2.h"
#import "videoNewsModel2.h"
@implementation videoNewsEntity2
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

//请求数据完成时调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _Array = [[NSMutableArray alloc]init];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *dic1 = [dic objectForKey:@"body"];
    NSString *str = [dic1 objectForKey:@"videoSrc"];
    
    videoNewsModel2 *model = [[videoNewsModel2 alloc]init];
    model.videoSrc = str;
    
    [_Array addObject:model];
    
    //（数据解析完成后）发送通知
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"toVideo2" object:_Array userInfo:nil];
    
    
}
@end
