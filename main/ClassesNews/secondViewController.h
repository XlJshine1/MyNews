//
//  secondViewController.h
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "headNews.h"

@interface secondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)NSString *str1;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSMutableArray *arrayThum;
@property(nonatomic,strong)NSMutableArray *arrayTitle;
@property(nonatomic,strong)NSMutableArray *arrayUpdateTime;
@property(nonatomic,strong)NSMutableArray *arrayId;
@property(nonatomic,strong)NSMutableArray *arrayImageData;
- (void)send:(NSNotification *)notification;
- (void)create:(NSIndexPath *)indexPath;
- (void)change:(UIButton *)sender and:(NSIndexPath *)indexPath;
@end
