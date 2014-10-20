//
//  detailViewController2.m
//  News
//
//  Created by xionglj on 14-9-26.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "detailViewController2.h"
#import "detailNewsEntity.h"
#import "UserModel.h"
#import "UserDB.h"
@implementation detailViewController2
{
    UIImageView * animatedImageView;
    UILabel *lableH;
    UIWebView *web;
    UIView *viewNext;
}
@synthesize array,str,Title;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)back
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)cleam
{
    UserModel *user = [[UserModel alloc]init];
    [[UserDB shareInstance]subUser:user andTitle:Title];
    
    viewNext.hidden = NO;
   [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1) userInfo:nil repeats:NO];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //导航栏
    UIView  *view10 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view10.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view10 addSubview:imageView10];
    [self.view addSubview:view10];
    
    //主标题
    lableH = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 240, 40)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.numberOfLines = 2;
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.font = [UIFont systemFontOfSize:15];
    lableH.text = Title;
    lableH.textColor = [UIColor blackColor];
    [view10 addSubview:lableH];
    //返回按钮
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view10 addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    //删除按钮
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(290, 5, 25, 25)];
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 25, 25);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"no1.png"] forState:UIControlStateNormal];
    [view3 addSubview:rightBtn];
    [view10 addSubview:view3];
    [rightBtn addTarget:self action:@selector(cleam) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    

   //数据请求
    NSURL *url = [NSURL URLWithString:str];
    detailNewsEntity *entity = [[detailNewsEntity alloc]init];
    [entity getNews:url];
    
    //
    web = [[UIWebView alloc]init];
    [self.view addSubview:web];
    web.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    
    //
    viewNext = [[UIView alloc]initWithFrame:CGRectMake(120, 150, 80, 40)];
    UILabel *lable = [[UILabel alloc]initWithFrame:viewNext.bounds];
    [viewNext addSubview:lable];
    lable.text = @"删除成功";
    lable.textAlignment = UITextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    lable.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewNext];
    viewNext.hidden = YES;
    

    
    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 320, 200)];
    
    animatedImageView.animationImages = [NSArray arrayWithObjects:   
                                         
                                         [UIImage imageNamed:@"00.tiff"],
                                         [UIImage imageNamed:@"01.tiff"],
                                         [UIImage imageNamed:@"02.tiff"],
                                         [UIImage imageNamed:@"03.tiff"],
                                         [UIImage imageNamed:@"04.tiff"],
                                         [UIImage imageNamed:@"05.tiff"],
                                         [UIImage imageNamed:@"06.tiff"],
                                         [UIImage imageNamed:@"07.tiff"],
                                         
                                         nil];
    
    animatedImageView.animationDuration = 0.5f;
    
    animatedImageView.animationRepeatCount = 0;
    
    [animatedImageView startAnimating];
    
    [self.view addSubview: animatedImageView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"todetailview" object:nil];
}

- (void)time1
{
    viewNext.hidden = YES;
}

-(void)send:(NSNotification *)notification
{
    array = notification.object;
    
    detailNewsModel *model = [[detailNewsModel alloc]init];
    model = [array objectAtIndex:0];
    web.frame = CGRectMake(0, 44, 320,416);
    
    //将文本转成NSData数据
    NSData *data=[model.text dataUsingEncoding:NSUTF8StringEncoding];
    //将数据加载到UIWebView中
    [web loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
    

    
    //停止加载动画
    [animatedImageView stopAnimating];
    
    
}

@end
