//
//  secondNewsController.h
//  myLine
//
//  Created by xionglj on 14-9-13.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "headNewsController.h"
#import "secondNewsModel.h"
#import "secondNewsEntity.h"
@interface secondNewsController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UIImageView *imageView1;
@property(nonatomic,strong)UILabel *lable2;
@property(nonatomic,strong)UIImageView *imageView2;
@property(nonatomic,strong)UILabel *lable3;
@property(nonatomic,strong)UIImageView *imageView3;
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *lable10;
@property(nonatomic,strong)UIImageView *image1;
@property(nonatomic,strong)UILabel *lable11;
@property(nonatomic,strong)UIImageView *image2;
@property(nonatomic,strong)UILabel *lable12;
@end
