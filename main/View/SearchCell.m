//
//  SearchCell.m
//  News
//
//  Created by xionglj on 14-9-29.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell
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
    self.textLabel.frame = CGRectMake(5, 5, 230, 60);
}

@end
