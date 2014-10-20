//
//  WebImageView.m
//  ASIHttpDemo2
//
//  Created by xionglj on 14-8-29.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "WebImageView.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
@implementation WebImageView
{
    ASIHTTPRequest *request1;
    ASIDownloadCache *cache;
    NSString  *str;
}
- (void)setImageURL:(NSURL *)url
{  //同步请求
    //[self synchronous:url];
    //异步请求
    [self aSynchronous:url];
}

//异步请求
- (void)aSynchronous:(NSURL *)url
{
    request1 = [ASIHTTPRequest requestWithURL:url];
    [request1 setRequestMethod:@"GET"];
    [request1 setTimeOutSeconds:60];
    //设置代理
    request1.delegate = self;
    
    
    
    //设置缓存
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    request1.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
    request1.downloadCache = cache;
    
    //发送异步请求
    [request1 startAsynchronous];
    
    
    
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSData *data = request.responseData;
    self.image = [UIImage imageWithData:data];
    
    
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = request.error;
    NSLog(@"请求网络出错：%@",error);
}
//同步请求
- (void)synchronous:(NSURL *)url
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    
    //发送同步请求
    [request startSynchronous];
    
    NSError *error = request.error;
    
    if (error == nil) {
        //获取请求下来的数据
        NSData *data = request.responseData;
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
    }else{
        NSLog(@"请求网络出错：%@",error);
    }
    
}



@end
