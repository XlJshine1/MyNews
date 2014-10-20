//
//  SearchDetailController.m
//  News
//
//  Created by xionglj on 14-9-29.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "SearchDetailController.h"

@implementation SearchDetailController
{
    UIWebView *web;
}
@synthesize str;
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [self.view addSubview:view];
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -40, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.text = @"搜 索";
    lableH.textColor = [UIColor blackColor];
    [view addSubview:lableH];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 44, 320, 416)];
    [self.view addSubview:web];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
       
}
//横竖屏适配方法
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        //左横屏
        web.frame = CGRectMake(0, 0, 480,300);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        //右横屏
        web.frame = CGRectMake(0, 0, 480,300);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        //竖屏
        web.frame = CGRectMake(0, 44, 320,416);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        //倒屏
        web.frame = CGRectMake(0, 44, 320,416);
    }
    return YES;
}


@end
