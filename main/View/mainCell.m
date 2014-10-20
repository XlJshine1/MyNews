//
//  mainCell.m
//  News
//
//  Created by xionglj on 14-9-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "mainCell.h"

@implementation mainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(2, 2, 68, 68);
    self.textLabel.frame = CGRectMake(75, 2, 240, 40);
    self.detailTextLabel.frame = CGRectMake(75, 45, 240, 25);
    
}

@end
