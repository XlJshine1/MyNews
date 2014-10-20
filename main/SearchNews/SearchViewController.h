//
//  SearchViewController.h
//  News
//
//  Created by xionglj on 14-9-28.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebImageView.h"
#import "SearchEntity.h"
@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
- (void)create:(NSIndexPath *)indexPath;
@end
