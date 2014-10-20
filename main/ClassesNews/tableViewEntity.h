//
//  tableViewEntity.h
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "headNews.h"
#import "ASIDownloadCache.h"
@interface tableViewEntity : NSObject
{
    ASIHTTPRequest *request;
    ASIDownloadCache *cache;
    NSString  *str;
}
@property(nonatomic,strong)NSMutableArray *Array;
@property(nonatomic,strong)NSData *Data1;
@property(nonatomic,strong)NSMutableData *Data;
- (void)getNews:(NSURL *)url;
- (UIImage *)getImage:(NSURL *)url;
@end
