//
//  headNewsEntity.m
//  myLine
//
//  Created by xionglj on 14-9-12.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "headNewsEntity.h"

@implementation headNewsEntity
@synthesize Array = _Array;
@synthesize Data1 = _Data1;



/*- (void)getNews:(NSURL *)url
{
     request=[ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:30];
    
    
    //设置网络请求完成后调用的block
    [request setCompletionBlock:^{
        _Data1 = [[NSMutableData alloc]initWithData:request.responseData];       
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data1 options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic2 = [dic objectForKey:@"body"];
        NSArray *arr = [dic2 objectForKey:@"item"];
        _Array = [[NSMutableArray alloc]init];
        NSLog(@"arr=%@",arr);
        
        for (NSDictionary *dic4 in arr) {
            headNews *model = [[headNews alloc]init];
            //model.thumbnail = [UIImage imageWithData:[self getImage:[dic4 objectForKey:@"thumbnail"]]];
            model.thumbnail = [self getImage:[dic4 objectForKey:@"thumbnail"]];
            NSLog(@"url=%@",[dic4 objectForKey:@"thumbnail"]);
            model.title = [dic4 objectForKey:@"title"];
            model.updateTime = [dic4 objectForKey:@"updateTime"];
            model.ID = [[[dic4 objectForKey:@"links"]objectAtIndex:0]objectForKey:@"url"];
            

            [_Array addObject:model];
            
         }
        
        //（数据解析完成后）发送通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"hehe" object:_Array userInfo:nil];
    
    }];
    
    
    //请求失败调用的block
    
    [request setFailedBlock:^{
        NSError *error = request.error;
        NSLog(@"请求网络出错:%@",error);
    }];
    
    
    //_Data1 = request.responseData;
    
    //设置缓存
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    request.cacheStoragePolicy = ASICacheForSessionDurationCacheStoragePolicy;
    request.downloadCache = cache;

    
    
    //发出异步请求
    [request startAsynchronous];
}


- (UIImage *)getImage:(NSString *)url
{
    request1=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request1 setRequestMethod:@"GET"];
    [request1 setTimeOutSeconds:30];
    
    
    //设置缓存
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    request1.cacheStoragePolicy = ASICacheForSessionDurationCacheStoragePolicy;
    request1.downloadCache = cache;
    
    [request1 startSynchronous];
    

    if(request1.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    UIImage *image = [[UIImage alloc]init];
    image = [UIImage imageWithData:request1.responseData];
    
    return image;
}*/



- (void)getNews:(NSURL *)url
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    

    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request1 delegate:self];
    
    if (connection) {

        _Data1 = [[NSMutableData alloc]init];
        

        
   }
        
}

//使用ASI第三方类库，获取图片
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
    
    [request startSynchronous];
    if(request.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    UIImage *image = [[UIImage alloc]init];
    image = [UIImage imageWithData:request.responseData];
    
    return image;
}





- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data1 appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求数据失败");
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成.....");
    NSError *error;

    
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data1 options:NSJSONReadingAllowFragments error:&error];
    NSDictionary *dic2 = [dic objectForKey:@"body"];
    NSArray *arr = [dic2 objectForKey:@"item"];
    _Array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic4 in arr) {
        headNews *model = [[headNews alloc]init];
        //model.thumbnail = [UIImage imageWithData:[self getImage:[dic4 objectForKey:@"thumbnail"]]];
        model.thumbnail = [self getImage:[dic4 objectForKey:@"thumbnail"]];
        NSLog(@"url=%@",[dic4 objectForKey:@"thumbnail"]);
        model.title = [dic4 objectForKey:@"title"];
        model.updateTime = [dic4 objectForKey:@"updateTime"];
        model.ID = [[[dic4 objectForKey:@"links"]objectAtIndex:0]objectForKey:@"url"];
        
        
        [_Array addObject:model];
        
        
    }
  
    //（数据解析完成后）发送通知
    
   [[NSNotificationCenter defaultCenter]postNotificationName:@"hehe" object:_Array userInfo:nil];
}

@end
