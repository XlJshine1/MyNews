//
//  videoNewsEntity.h
//  News
//
//  Created by xionglj on 14-9-21.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "videoNewsModel.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
@interface videoNewsEntity : NSObject
{
    ASIHTTPRequest *request;
    ASIDownloadCache *cache;
}
@property(nonatomic,strong)NSMutableArray *Array;

@property(nonatomic,strong)NSMutableData *Data;
- (void)getNews:(NSURL *)url;
- (UIImage *)getImage:(NSString *)url;
@end
