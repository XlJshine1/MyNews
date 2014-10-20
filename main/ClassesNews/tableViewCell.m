//
//  tableViewCell.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "tableViewCell.h"

@implementation tableViewCell
@synthesize mainLable,btn,btn1;
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(228, 2, 90, 76);
    self.textLabel.frame = CGRectMake(5, 2, 210, 45);
    self.textLabel.backgroundColor = [UIColor whiteColor];
    self.detailTextLabel.frame = CGRectMake(5, 55, 160, 15);
    self.detailTextLabel.backgroundColor = [UIColor whiteColor];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        mainLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 6, 310, 80)];
        [self.contentView addSubview:mainLable];
        mainLable.backgroundColor = [UIColor whiteColor];
        [mainLable addSubview:self.imageView];
        [mainLable addSubview:self.textLabel];
        [mainLable addSubview:self.detailTextLabel];
        
        btn = [[UIButton alloc]initWithFrame:CGRectMake(165, 60, 15, 15)];
        [btn setImage:[UIImage imageNamed:@"like_icon_v2@2x.png"] forState:UIControlStateNormal];

        btn1 = [[UIButton alloc]initWithFrame:CGRectMake(190, 60, 15, 15)];
        [btn1 setImage:[UIImage imageNamed:@"btn_share_pressed@2x.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.contentView addSubview:btn1];
        
       
        //[btn1 addTarget:self action:@selector(fenxiang) forControlEvents:UIControlEventTouchUpInside];
     }
    return self;
}

//- (void)love1
//{
//    [btn setImage:[UIImage imageNamed:@"like_icon_v2@2x.png"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(love) forControlEvents:UIControlEventTouchUpInside];
//}

@end
