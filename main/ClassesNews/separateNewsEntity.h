//
//  separateNewsEntity.h
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@interface separateNewsEntity : NSObject
@property(nonatomic,strong)NSMutableArray *Array;

@property(nonatomic,strong)NSMutableData *Data;
- (void)getNews:(NSURL *)url;
//- (NSData *)getImage:(NSURL *)url;
@end
