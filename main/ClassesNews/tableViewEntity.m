//
//  tableViewEntity.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "tableViewEntity.h"
@implementation tableViewEntity
@synthesize Array = _Array;
@synthesize Data = _Data;
@synthesize Data1 = _Data1;
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

//异步请求代理方法－－返回数据，加入到(NSData*) _Data 中
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求数据失败");
}
//使用ASI第三方类库，获取图片
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
    _Data1 = [[NSData alloc]initWithData:request.responseData];
    
    return image;
}

//请求数据完成时调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成.....");
    NSError *error;
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:_Data options:NSJSONReadingAllowFragments error:&error ];
    
    //对新闻主页进行解析
    NSLog(@"error=%@",error);
    NSDictionary *dic = [arr objectAtIndex:0];
    NSDictionary *dic2 = [dic objectForKey:@"body"];
    
    NSArray *array = [dic2 objectForKey:@"item"];
    
    
    //遍历字典
    _Array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic3 in array) 
    {   
        headNews *model = [[headNews alloc]init];
        model.ID = [dic3 objectForKey:@"id"];
        
        model.updateTime = [dic3 objectForKey:@"updateTime"];
        model.title = [dic3 objectForKey:@"title"];
        //str = [dic3 objectForKey:@"thumbnail"];
        
        model.thumbnail1 = [dic3 objectForKey:@"thumbnail"];
       
        //如果图片地址为空，册给图片设置为默认图片
        /*if (str.length != 0) {
            model.thumbnail = [self getImage:[dic3 objectForKey:@"thumbnail"]];
            model.imageData = _Data1;
            NSLog(@"_Data1===========%@",model.imageData);
            
        }
        else {
            model.thumbnail = [UIImage imageNamed:@"6.png"];
        
            model.imageData = UIImagePNGRepresentation(model.thumbnail); 
        
        }*/
 
        
        [_Array addObject:model];

    }

 
    
    //（数据解析完成后）发送通知
    
  
       [[NSNotificationCenter defaultCenter]postNotificationName:@"totableView" object:_Array userInfo:nil];
    
    
    
    
    
}
@end
