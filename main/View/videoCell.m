//
//  videoCell.m
//  News
//
//  Created by xionglj on 14-9-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "videoCell.h"

@implementation videoCell
@synthesize mainLable;
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(218, 2, 90, 66);
    self.textLabel.frame = CGRectMake(5, 8, 210, 40);
   
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        mainLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 6, 310, 70)];
        mainLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:mainLable];
        [mainLable addSubview:self.imageView];
        [mainLable addSubview:self.textLabel];
        [mainLable addSubview:self.detailTextLabel];
    }
    return self;
}

@end
