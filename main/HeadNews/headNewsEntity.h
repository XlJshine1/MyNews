//
//  headNewsEntity.h
//  myLine
//
//  Created by xionglj on 14-9-12.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "headNews.h"
#import "ASIDownloadCache.h"
@interface headNewsEntity : NSObject
{
    ASIHTTPRequest *request;
    ASIDownloadCache *cache;
   // ASIHTTPRequest *request1;
}
@property(nonatomic,strong)NSMutableArray *Array;
@property(nonatomic,strong)NSMutableData *Data1;
- (void)getNews:(NSURL *)url;
- (UIImage *)getImage:(NSURL *)url;
@end
