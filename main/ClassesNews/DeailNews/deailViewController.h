//
//  deailViewController.h
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface deailViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate>
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)NSString *str1;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSArray *IDarray;
@property(nonatomic,strong)NSArray *Titlearray;
@property(nonatomic,strong)NSString *Number;
@property(nonatomic,strong)NSArray *imageData;
@property(nonatomic,strong)NSArray *Timearray;
@property(nonatomic,strong)NSArray *Urlarray;
- (void)back;
- (void)btnBack:(UIButton *)btn;
- (void)lableText:(UILabel *)lable;
- (void)time;
- (void)createBarButton;
@end
