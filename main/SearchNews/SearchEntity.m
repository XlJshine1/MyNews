//
//  SearchEntity.m
//  News
//
//  Created by xionglj on 14-9-28.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "SearchEntity.h"
#import "SearchModel.h"
@implementation SearchEntity
@synthesize Array = _Array;
@synthesize Data = _Data;
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
    NSLog(@"请求完成.....");
    NSError *error;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data options:NSJSONReadingAllowFragments error:&error ];
     _Array = [[NSMutableArray alloc]init];
    NSArray *array = [dic objectForKey:@"data"];
    for (NSDictionary *dic2 in array) {
        SearchModel *model = [[SearchModel alloc]init];
        model.source = [dic2 objectForKey:@"source"];
        model.title = [dic2 objectForKey:@"title"];
        model.image_url = [[dic2 objectForKey:@"middle_image"]objectForKey:@"url"];
        model.url = [dic2 objectForKey:@"display_title"];
        
        NSLog(@"11=================%@",model.source);
        NSLog(@"22=================%@",model.title);
        NSLog(@"33=================%@",model.image_url);
        NSLog(@"44=================%@",model.url);
        
        [_Array addObject:model];
      
        
    }

    
   
    
   
    
//    //（数据解析完成后）发送通知
   
    [[NSNotificationCenter defaultCenter]postNotificationName:@"toSearchView" object:_Array userInfo:nil];
    
    
    
    
    
    
}
@end
