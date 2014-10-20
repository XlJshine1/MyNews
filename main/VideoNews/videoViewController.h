//
//  videoViewController.h
//  News
//
//  Created by xionglj on 14-9-21.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebImageView.h"
@interface videoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSMutableArray *arrayUrl;
@property(nonatomic,strong)NSMutableArray *arrayImage;
@property(nonatomic,strong)NSMutableArray *arrayTitle;
@property(nonatomic,strong)NSString *str2;
- (void)create:(NSIndexPath *)indexPath;
-(void)send:(NSNotification *)notification;
@end
