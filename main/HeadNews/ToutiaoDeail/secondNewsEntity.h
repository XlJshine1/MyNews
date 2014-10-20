//
//  secondNewsEntity.h
//  myLine
//
//  Created by xionglj on 14-9-13.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "senondModel.h"
#import "ASIDownloadCache.h"
@interface secondNewsEntity : NSObject
{
    ASIHTTPRequest *request;
    ASIDownloadCache *cache;
}
@property(nonatomic,strong)NSMutableArray *Array;
@property(nonatomic,strong)NSMutableData *Data1;
- (void)getNews:(NSURL *)url;
- (UIImage *)getImage:(NSURL *)url;
@end
