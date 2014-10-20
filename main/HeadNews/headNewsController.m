//
//  headNewsController.m
//  myLine
//
//  Created by xionglj on 14-9-12.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "headNewsController.h"
#import "headNews.h"
#import "headNewsEntity.h"
//#import "secondNewsController.h"
@implementation headNewsController
{
    secondNewsController *snc;
}
@synthesize array,myID,myID1,myID2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //隐藏tabBar
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

 - (void)viewDidLoad
 {
   [super viewDidLoad];
     
     
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"111.png"]];
     self.navigationItem.title = @"新闻头条";
     
     //网络请求
    NSString *str =  @"http://api.3g.ifeng.com/iosNews?id=aid=SYDT10&imgwidth=100&type=list&pagesize=20";
     NSURL *url = [NSURL URLWithString:str];
    headNewsEntity *entity = [[headNewsEntity alloc]init];
     [entity getNews:url];
     

     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"hehe" object:nil];
 }

- (void)send:(NSNotification *)notification
{
    
    headNews *model = [[headNews alloc]init];
   
    model = [notification.object objectAtIndex:0];
    
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 90, 90)];
    imageView.backgroundColor = [UIColor grayColor];
    [btn addSubview:imageView];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(105, 5, 200, 40)];
    lable.numberOfLines = 2;
    lable.backgroundColor = [UIColor clearColor];
    [btn addSubview:lable];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(105, 50, 200, 40)];
    lable1.backgroundColor = [UIColor clearColor];
    [btn addSubview:lable1];
    [self.view addSubview:btn];
    UILabel *lable01 = [[UILabel alloc]initWithFrame:CGRectMake(0, 99, 320, 1)];
    lable01.backgroundColor = [UIColor purpleColor];
    [btn addSubview:lable01];
    UILabel *lable001 = [[UILabel alloc]initWithFrame:CGRectMake(0, 1, 320, 1)];
    lable001.backgroundColor = [UIColor purpleColor];
    [btn addSubview:lable001];
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 320, 100)];
    UILabel *lable02 = [[UILabel alloc]initWithFrame:CGRectMake(0, 99, 320, 1)];
    lable02.backgroundColor = [UIColor purpleColor];
    [btn2 addSubview:lable02];
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 90, 90)];
    imageView2.backgroundColor = [UIColor grayColor];
    [btn2 addSubview:imageView2];
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(105, 5, 200, 40)];
    lable2.numberOfLines = 2;
        lable2.backgroundColor = [UIColor clearColor];
    [btn2 addSubview:lable2];
    UILabel *lable21 = [[UILabel alloc]initWithFrame:CGRectMake(105, 50, 200, 38)];
        lable21.backgroundColor = [UIColor clearColor];
    [btn2 addSubview:lable21];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 320, 100)];
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 90, 90)];
    imageView3.backgroundColor = [UIColor grayColor];
    [btn3 addSubview:imageView3];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(105, 5, 200, 40)];
    lable3.numberOfLines = 2;
        lable3.backgroundColor = [UIColor clearColor];
    [btn3 addSubview:lable3];
    UILabel *lable31 = [[UILabel alloc]initWithFrame:CGRectMake(105, 50, 200, 40)];
        lable31.backgroundColor = [UIColor clearColor];
    [btn3 addSubview:lable31];
    [self.view addSubview:btn3];
    UILabel *lable03 = [[UILabel alloc]initWithFrame:CGRectMake(0, 99, 320, 1)];
    lable03.backgroundColor = [UIColor purpleColor];
    [btn3 addSubview:lable03];
    [btn3 addTarget:self action:@selector(action2) forControlEvents:UIControlEventTouchUpInside];
    
    
    imageView.image = model.thumbnail;
    imageView2.image = model.thumbnail1;
    imageView3.image = model.thumbnail2;
    
    lable.text = model.title;
    lable2.text = model.title1;
    lable3.text = model.title2;
    
    lable1.text = model.updataTime;
    lable21.text = model.updataTime1;
    lable31.text = model.updataTime2;
    
    myID = [[NSString alloc]init];
    myID1 = [[NSString alloc]init];
    myID2 = [[NSString alloc]init];
    
    self.myID = model.ID;
    self.myID1 = model.ID1;
    self.myID2 = model.ID2;
    
    NSLog(@"hhhhh = %@",model.ID);
    NSLog(@"self.myID = %@",self.myID);
    
}
- (void)action
{
    snc = [[secondNewsController alloc]init];
      snc.str = self.myID;
     NSLog(@"str = %@",self.myID);
    [self.navigationController pushViewController:snc animated:YES];
}
- (void)action1
{
    snc = [[secondNewsController alloc]init];
     snc.str = self.myID1;
     NSLog(@"str = %@",self.myID1);
    [self.navigationController pushViewController:snc animated:YES];
}
- (void)action2
{
    snc = [[secondNewsController alloc]init];
     snc.str = self.myID2;
    NSLog(@"str = %@",self.myID2);
    [self.navigationController pushViewController:snc animated:YES];
}

@end
