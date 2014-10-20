//
//  secondNewsEntity.m
//  myLine
//
//  Created by xionglj on 14-9-13.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "secondNewsEntity.h"

@implementation secondNewsEntity
@synthesize Array = _Array;
@synthesize Data1 = _Data1;


//请求接口数据，异步方法
- (void)getNews:(NSURL *)url
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
     NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request1 delegate:self];
    
     if (connection) 
     {
    
         _Data1 = [[NSMutableData alloc]init];
      
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

//异步请求代理方法－－返回数据，加入到(NSData*) _Data1 中
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data1 appendData:data];
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
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data1 options:NSJSONReadingAllowFragments error:&error ];
    
    //对新闻主页进行解析
    NSLog(@"error=%@",error);
    NSLog(@"data%@",dic);
    
    NSDictionary *dic2 = [dic objectForKey:@"body"];
    
    NSArray *array = [dic2 objectForKey:@"slides"];

    
    //遍历字典
    _Array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic3 in array) 
    {
         senondModel *model = [[senondModel alloc]init];
         model.title = [dic2 objectForKey:@"title"];
         model.image = [self getImage:[dic3 objectForKey:@"image"]];
         model.description = [dic3 objectForKey:@"description"];
        
        [_Array addObject:model];
    }
    //（数据解析完成后）发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"send" object:_Array userInfo:nil];
    
    
    
    
    
    
}
@end
