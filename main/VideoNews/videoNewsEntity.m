//
//  videoNewsEntity.m
//  News
//
//  Created by xionglj on 14-9-21.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "videoNewsEntity.h"

@implementation videoNewsEntity
@synthesize Array = _Array;
@synthesize Data = _Data;
//请求接口数据，异步方法
- (void)getNews:(NSURL *)url
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request1 delegate:self];
    
    if (connection) 
    {
        
        _Data = [[NSMutableData alloc]init];
        
    }
    
}
//请求网络图片，同步方法
- (UIImage *)getImage:(NSString *)url
{
    request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:30];
    
    //设置缓存
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    request.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
    request.downloadCache = cache;
    
    
    //发送同步请求
    [request startSynchronous];
    if(request.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    //返回请求数据
    UIImage *image = [[UIImage alloc]init];
    image = [UIImage imageWithData:request.responseData];
    
    return image;
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
    NSArray *arr = [dic1 objectForKey:@"subjects"];
    for (NSDictionary *dic2 in arr) {
        if ([dic2 objectForKey:@"podItems"] != nil) {
            NSArray *arr1 = [dic2 objectForKey:@"podItems"];
            for (NSDictionary *dic3 in arr1) {
                 NSLog(@"Has======%@",[dic3 objectForKey:@"hasVideo"]);
                 NSString *a = [NSString stringWithFormat: @"%@",[dic3 objectForKey:@"hasVideo"]];
               
                if ([a isEqualToString:@"1"]) {
                    NSArray *arr2 = [dic3 objectForKey:@"links"];
                    
                    NSString *str = [dic3 objectForKey:@"title"];
                    NSString *image = [dic3 objectForKey:@"thumbnail"];
                    for (NSDictionary *dic4 in arr2) {
                        NSString *string = [dic4 objectForKey:@"url"];
                        videoNewsModel *model = [[videoNewsModel alloc]init];
                        model.url = string;
                        model.title = str;
                        model.image = image;
                        
                        NSLog(@"====%@",model.image);
                        
                        [_Array addObject:model];
                    }
                }
            }
            
        }
    }
  
   //（数据解析完成后）发送通知
    
   [[NSNotificationCenter defaultCenter]postNotificationName:@"toVideo" object:_Array userInfo:nil];
    
  
}
@end
