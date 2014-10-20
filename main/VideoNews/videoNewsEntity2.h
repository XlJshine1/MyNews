//
//  videoNewsEntity2.h
//  News
//
//  Created by xionglj on 14-9-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface videoNewsEntity2 : NSObject
@property(nonatomic,strong)NSMutableArray *Array;

@property(nonatomic,strong)NSMutableData *Data;
- (void)getNews:(NSURL *)url;

@end
