//
//  SearchEntity.h
//  News
//
//  Created by xionglj on 14-9-28.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchEntity : NSObject
@property(nonatomic,strong)NSMutableArray *Array;
@property(nonatomic,strong)NSMutableData *Data;
- (void)getNews:(NSURL *)url;
@end
