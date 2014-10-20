//
//  MainViewControllerCell.m
//  News
//
//  Created by xionglj on 14-9-19.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "MainViewControllerCell.h"

@implementation MainViewControllerCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(40, 0, 40, 40);
    self.textLabel.frame = CGRectMake(100, 0, 100, 40);
}

@end
