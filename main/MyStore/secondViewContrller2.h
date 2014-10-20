//
//  secondViewContrller2.h
//  News
//
//  Created by xionglj on 14-9-26.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewContrller2 : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) NSArray *array;
- (void)create:(NSIndexPath *)indexPath;
- (void)loadData;
@end
